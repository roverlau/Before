//
//  SearchViewController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchReusableView.h"
#import "SearchCell.h"
#import "SearchCleanView.h"
#import "SearchResultController.h"

@interface SearchViewController ()<UISearchBarDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (strong,nonatomic) NSMutableArray * hotArr;

@property (strong,nonatomic) NSMutableArray * historyArr;

@property (strong,nonatomic) UISearchBar * searchBar;


@end

@implementation SearchViewController
//懒加载
- (NSMutableArray *)hotArr
{
    if (!_hotArr)
    {
        _hotArr = [NSMutableArray new];
    }
    return _hotArr;
}

- (NSMutableArray *)historyArr
{
    if (!_historyArr)
    {
        _historyArr =[NSMutableArray new];
    }
    return _historyArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
}
//数据
- (void)initData
{

    [self.historyArr addObjectsFromArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"searchHistory"]];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:Search_URL parameters:@{@"page":@"1"} success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        for (NSString * item in responseObject)
        {
            [self.hotArr addObject:item];
        }
        [self.collectionView reloadData];
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        
        
    }];
}
//界面
- (void)initUI
{
    [self.tableView removeFromSuperview];

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.collectionView.frame = CGRectMake(0, 64, ZScreenWidth, ZScreenHeight-64);
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    
    //搜索框
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(8, 28, ZScreenWidth - 16, 22)];
    self.searchBar.delegate = self;
    self.searchBar.returnKeyType = UIReturnKeySearch;
    self.navigationItem.titleView = _searchBar;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:59/255.0 green:54/255.0 blue:76/255.0 alpha:1.0];
    _searchBar.placeholder = @"搜索单品/攻略";
    
    [self registerReusableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cleanHistory) name:@"shouldCleanHistory" object:nil];
}

- (void)cleanHistory
{
    [self.historyArr removeAllObjects];
    [[NSUserDefaults standardUserDefaults]setObject:nil forKey:@"searchHistory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.collectionView reloadData];
}

- (void)registerReusableView
{
    [self.collectionView registerClass:[SearchCell class] forCellWithReuseIdentifier:@"searchCell"];
    [self.collectionView registerClass:[SearchReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"searchReusableView"];
    [self.collectionView registerClass:[SearchCleanView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"searchCleanView"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.collectionView reloadData];
    //设置状态栏颜色
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.searchBar becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.historyArr.count != 0)
    {
        return 2;
    }
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return self.hotArr.count;
    }
    return self.historyArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchCell" forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        [cell refreshUIWith:self.hotArr[indexPath.row]];
    }
    else
    {
        [cell refreshUIWith:self.historyArr[indexPath.row]];
    }

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ZScreenWidth/5, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        SearchReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"searchReusableView" forIndexPath:indexPath];
        if (indexPath.section == 0)
        {
            [view refreshUIWith:@"热门搜索"];
            
            return view;
        }
        [view refreshUIWith:@"搜索历史"];
        return view;
    }
    SearchCleanView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"searchCleanView" forIndexPath:indexPath];

        return view;

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ZScreenWidth, 20);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeZero;
    }
     return CGSizeMake(ZScreenWidth, 40);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        [self beginSearch:self.hotArr[indexPath.row]];
    }
    else
    {
        [self beginSearch:self.historyArr[indexPath.row]];
    }
}
//搜索判断
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    [self beginSearch:searchBar.text];
  
    
}

- (void)beginSearch:(NSString *)searchKey
{
    NSArray * temp = [NSArray arrayWithArray:self.historyArr];
    for (NSString * repeat in temp)
    {
        if ([searchKey isEqualToString:repeat])
        {
            [self.historyArr removeObject:repeat];
        }
    }
    [self.historyArr insertObject:searchKey atIndex:0];
    if (self.historyArr.count > 10)
    {
        [self.historyArr removeLastObject];
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.historyArr forKey:@"searchHistory"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self intoResultCtl:searchKey];

}
- (void)intoResultCtl:(NSString *)searchKey
{
    SearchResultController * ctl = [SearchResultController new];
    ctl.planPage = 1;
    ctl.objPage = 1;
    ctl.searchKey = [searchKey stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self presentViewController:ctl animated:YES completion:nil];
}
#pragma mark - 网络搜索

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]] || [scrollView isKindOfClass:[UITableView class]])
    {
        return;
    }
    
    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.searchBar resignFirstResponder];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]] || [scrollView isKindOfClass:[UITableView class]])
    {
        return;
    }
    
    [self.searchBar becomeFirstResponder];
}
@end
