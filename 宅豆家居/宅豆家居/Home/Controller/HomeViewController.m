//
//  HomeViewController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeScrollViewCell.h"
#import "HomeScrollViewModel.h"
#import "FourButtonCell.h"
#import "HomeAdModel.h"
#import "HomeAdCell.h"
#import "HomeCellModel.h"
#import "HomeCell.h"
#import "HomeCellDetailController.h"
#import "LotteriesDetailController.h"
#import "RetweetDetailController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
//banner数据
@property (strong,nonatomic) NSMutableArray * scrollViewArr;
//第一个cell数据
@property (strong,nonatomic) NSMutableArray * adCellArr;
//后续cell数据
@property (strong,nonatomic) NSMutableArray * dataArr;

@property (assign,nonatomic) NSInteger page;

@property (strong,nonatomic) FMDatabase * database;

@property (assign,nonatomic) BOOL isRefresh;

@property (assign,nonatomic) BOOL hasScrollViewObserver;

@property (assign,nonatomic) BOOL hasFourButtonCellObserver;
@end

@implementation HomeViewController
//懒加载
- (NSMutableArray *)scrollViewArr
{
    if (!_scrollViewArr)
    {
        _scrollViewArr = [NSMutableArray new];
    }
    return _scrollViewArr;
}

- (NSMutableArray *)adCellArr
{
    if (!_adCellArr)
    {
        _adCellArr = [NSMutableArray new];
    }
    return _adCellArr;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr = [NSMutableArray new];
    }
    return  _dataArr;
}

- (FMDatabase *)database
{
    if (!_database)
    {
        _database = [[FMDatabase alloc] initWithPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/cache.rdb"]];
        if(![_database open])
        {
            NSLog(@"数据库打开失败");
        }
        if(![_database executeUpdate:@"create table if not exists ScrollView (id integer primary key autoincrement, scrollView blob)"])
        {
            NSLog(@"创建ScrollView表失败");
        }
        if(![_database executeUpdate:@"create table if not exists AdCell (id integer primary key autoincrement, adCell nlob)"])
        {
            NSLog(@"创建AdCell表失败");
        }
        if(![_database executeUpdate:@"create table if not exists HomeCell (id integer primary key autoincrement, homeCell)"])
        {
            NSLog(@"创建HomeCell失败");
        }
    }
    return _database;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //数据整合
    [self initData];
    //UI整合
    [self initUI];
    
    
}

#pragma mark - UI
//加载UI
- (void)initUI
{
    [self.collectionView removeFromSuperview];
    [self registerReusableView];

}


//注册复用cell
- (void)registerReusableView
{
    [self.tableView registerClass:[HomeScrollViewCell class] forCellReuseIdentifier:@"scrollViewCell"];
    [self.tableView registerClass:[FourButtonCell class] forCellReuseIdentifier:@"fourButtonCell"];
    [self.tableView registerClass:[HomeAdCell class] forCellReuseIdentifier:@"homeAdCell"];
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"homeCell"];
}

#pragma mark - 数据
//加载数据
- (void)initData
{
    self.page = 1;
    [self refreshData];
    [self loadFromDatabase];
}

//本地读取
- (void)loadFromDatabase
{
    NSLog(@"%@",NSHomeDirectory());
    
    //ScrollView
    FMResultSet * set = [self.database executeQuery:@"select * from ScrollView"];
    while ([set next])
    {
        NSData * data = [set dataForColumn:@"scrollView"];
        NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary * dic in responseObject[@"sale_banners"])
        {
            HomeScrollViewModel * model = [[HomeScrollViewModel alloc] initWithDictionary:dic error:nil];
            [self.scrollViewArr addObject:model];
        }
        [self.tableView reloadData];
    }
    
    //AdCell
    set = nil;
    set = [self.database executeQuery:@"select * from AdCell"];
    while ([set next])
    {
        NSData * data = [set dataForColumn:@"adCell"];
        NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary * dic in responseObject[@"sales"])
        {
            HomeAdModel * model = [[HomeAdModel alloc] initWithDictionary:dic error:nil];
            [self.adCellArr addObject:model];
        }
        [self.tableView reloadData];
    }
    
    set = nil;
    set = [self.database executeQuery:@"select * from HomeCell"];
    while ([set next])
    {
        NSData * data = [set dataForColumn:@"homeCell"];
        NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary * dic in responseObject[@"articles"])
        {
            HomeCellModel * model = [[HomeCellModel alloc] initWithDictionary:dic error:nil];
            [self.dataArr addObject:model];
        }
        [self.tableView reloadData];
    }
    [self isOnline];
}

- (void)isOnline
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
    {
        if (status == AFNetworkReachabilityStatusNotReachable )
        {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"哎呀,不好了!" message:@"似乎断网了嘞~~~" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
        }
        else
        {
            [self loadDataFromNet];
        }
        
    }];
}

- (void)loadDataFromNet
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];

    if (self.page == 1)
    {
        //ScrollView AdCell HomeCell
        [self.database executeUpdate:@"delete from ScrollView"];
        [self.database executeUpdate:@"delete from sqlite_sequence where name = 'ScrollView'"];
        [self.database executeUpdate:@"delete from AdCell"];
        [self.database executeUpdate:@"delete from sqlite_sequence where name = 'AdCell'"];
        [self.database executeUpdate:@"delete from HomeCell"];
        [self.database executeUpdate:@"delete from sqlite_sequence where name = 'HomeCell'"];
        
        
        //scrollView
        [manager GET:HomeScrollView_URL parameters:@{@"status":@"2",@"page":[NSString stringWithFormat:@"%zd",self.page]} success:^void(AFHTTPRequestOperation * operation, id responseObject)
         {
             NSData * data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
             if(![self.database executeUpdate:@"insert into ScrollView (scrollView) values (?)",data])
             {
                 NSLog(@"插入失败");
             }
             [self refreshFromDatabase];
         }
             failure:^void(AFHTTPRequestOperation * operation, NSError * error)
         {
             NSLog(@"error = %@",error);
             
         }];
        
        //HomeAd
        [manager GET:HomeAd_URL parameters:@{@"page":[NSString stringWithFormat:@"%zd",self.page]} success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             NSData * data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
             if(![self.database executeUpdate:@"insert into AdCell (adCell) values (?)",data])
             {
                 NSLog(@"插入失败");
             }
             [self refreshFromDatabase];
         }
             failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             
             NSLog(@"error = %@",error);
         }];
        
        
    }
    
    //HomeCell
    [manager GET:HomeCell_URL parameters:@{@"page":[NSString stringWithFormat:@"%zd",self.page]} success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSData * data = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil];
         if(![self.database executeUpdate:@"insert into HomeCell (homeCell) values (?)",data])
         {
             NSLog(@"插入失败");
         }
         [self refreshFromDatabase];
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"error = %@",error);
         
     }];
    

}


- (void)refreshFromDatabase
{
    if (self.page == 1)
    {
        [self.dataArr removeAllObjects];
        [self.adCellArr removeAllObjects];
        [self.scrollViewArr removeAllObjects];
        //ScrollView
        FMResultSet * set = [self.database executeQuery:@"select * from ScrollView"];
        while ([set next])
        {
            NSData * data = [set dataForColumn:@"scrollView"];
            NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            for (NSDictionary * dic in responseObject[@"sale_banners"])
            {
                HomeScrollViewModel * model = [[HomeScrollViewModel alloc] initWithDictionary:dic error:nil];
                [self.scrollViewArr addObject:model];
            }
            [self.tableView reloadData];
        }
        
        //AdCell
        set = nil;
        set = [self.database executeQuery:@"select * from AdCell"];
        while ([set next])
        {
            NSData * data = [set dataForColumn:@"adCell"];
            NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            for (NSDictionary * dic in responseObject[@"sales"])
            {
                HomeAdModel * model = [[HomeAdModel alloc] initWithDictionary:dic error:nil];
                [self.adCellArr addObject:model];
            }
            [self.tableView reloadData];
        }

    }
    
    FMResultSet * set = [self.database executeQuery:@"select * from HomeCell"];
    NSInteger i = 0;
    while ([set next])
    {
        
        if (i < self.page - 1)
        {
            i++;
            continue;
        }
        NSData * data = [set dataForColumn:@"homeCell"];
        NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary * dic in responseObject[@"articles"])
        {
            HomeCellModel * model = [[HomeCellModel alloc] initWithDictionary:dic error:nil];
            [self.dataArr addObject:model];
        }
        [self.tableView reloadData];
    }

}

#pragma mark - 上下拉刷新
- (void)refreshData
{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self loadDataFromNet];
        self.isRefresh = YES;
        [self.tableView.header endRefreshing];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.page ++;
        [self loadDataFromNet];
        self.isRefresh = YES;
        [self.tableView.footer endRefreshing];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3 + self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        HomeScrollViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"scrollViewCell"];
        if (self.scrollViewArr.count > 0)
        {
            if (!self.hasScrollViewObserver)
            {
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showScrollViewDetail:) name:@"scrollViewOffset" object:cell.scrollView];
                self.hasScrollViewObserver = YES;
            }
            
             [cell refreshImagesWithimageArr:self.scrollViewArr];
        }
       
        return cell;
    }
    else if (indexPath.row == 1)
    {
        FourButtonCell * cell = [tableView dequeueReusableCellWithIdentifier:@"fourButtonCell"];
        if (!self.hasFourButtonCellObserver)
        {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showFourButtonDetail:) name:@"fourButtonCell" object:cell];
        }
        return cell;
    }
    else if (indexPath.row == 2)
    {
        HomeAdCell * cell = [tableView dequeueReusableCellWithIdentifier:@"homeAdCell"];
        if (self.adCellArr.count > 0)
        {
            [cell refreshUIWithModel:self.adCellArr[0]];
        }
        return cell;
    }
    HomeCell * cell = [tableView dequeueReusableCellWithIdentifier:@"homeCell"];
    if (self.dataArr.count > 0)
    {
        [cell refreshUIWithMOdel:self.dataArr[indexPath.row - 3]];
    }
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 180;
    }
    else if (indexPath.row == 1)
    {
        return 80;
    }
    else if (indexPath.row == 2)
    {
        return 180;
    }
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >2)
    {
        HomeCellDetailController * ctl = [HomeCellDetailController new];
        ctl.title = ((HomeCellModel *)self.dataArr[indexPath.row - 3]).title;
        ctl.cellId = ((HomeCellModel *)self.dataArr[indexPath.row - 3]).cellId;
        [self presentViewController:ctl animated:YES completion:nil];
    }
}

- (void)showScrollViewDetail:(NSNotification *)sender
{
    NSLog(@"%@",[sender userInfo][@"offset"]);
    NSInteger index = [[sender userInfo][@"offset"] integerValue];
    
}

- (void)showFourButtonDetail:(NSNotification *)sender
{
    
    switch ([[sender userInfo][@"tag"] integerValue]) {
        case 11:
        {
            LotteriesDetailController * ctl = [LotteriesDetailController new];
            ctl.url = Lotteries_URL;
            [self presentViewController:ctl animated:YES completion:nil];
            break;
        }
        case 12:
        {
            RetweetDetailController * ctl = [RetweetDetailController new];
            ctl.url = Retweet_URL;
            [self presentViewController:ctl animated:YES completion:nil];
        }
        default:
            break;
    }
    
}
@end
