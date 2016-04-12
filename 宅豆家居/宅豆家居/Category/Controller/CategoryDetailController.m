//
//  CategoryDetailController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryDetailController.h"
#import "CategoryDetailCell.h"
#import "CategoryDetailModel.h"
#import "CategoryCellDetailController.h"

@interface CategoryDetailController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView * CategoryDetailCollectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout * CategoryDetailLayout;
@property (strong,nonatomic) UIButton * backBtn;
@end

@implementation CategoryDetailController

- (NSMutableArray *)CategoryDetailArr
{
    if (!_CategoryDetailArr)
    {
        _CategoryDetailArr = [NSMutableArray new];
    }
    return _CategoryDetailArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

- (void)initUI
{
    self.CategoryDetailLayout = [UICollectionViewFlowLayout new];
    self.CategoryDetailCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, ZScreenHeight) collectionViewLayout:_CategoryDetailLayout];
    _CategoryDetailCollectionView.delegate = self;
    _CategoryDetailCollectionView.dataSource = self;
    _CategoryDetailLayout.minimumInteritemSpacing = 3;
    _CategoryDetailLayout.minimumLineSpacing = 3;
    
    _CategoryDetailCollectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.view addSubview:_CategoryDetailCollectionView];
    //顶部视图
//    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, 45)];
//    topView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:topView];
    //返回btn
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    //    [backBtn setTitle:@"go back" forState:UIControlStateNormal];
    _backBtn.frame = CGRectMake(0, 0, 25, 25);
    _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight-15);
    [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    
    //注册复用View
    [self registerReusableView];
    
    
}

- (void)registerReusableView
{
    [self.CategoryDetailCollectionView registerClass:[CategoryDetailCell class] forCellWithReuseIdentifier:@"categoryDetailCell"];
}
#pragma mark - 数据相关
- (void)initData
{
    self.CategoryDetailPage = 1;
    [self refreshData];
    [self loadData];
}

#pragma mark - 上下拉刷新
- (void)refreshData
{
    self.CategoryDetailCollectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.CategoryDetailPage = 1;
        [self loadData];
        [self.CategoryDetailCollectionView.header endRefreshing];
        
    }];
    self.CategoryDetailCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.CategoryDetailPage++;
        [self loadData];
        [self.CategoryDetailCollectionView.footer endRefreshing];
    }];
}

- (void)loadData
{
    
    if (self.CategoryDetailPage == 1)
    {
        [self.CategoryDetailArr removeAllObjects];
    }
    /*
     item_catetory_id 为单品id值
     per_page 10
     page 1
     */
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:CategoryDetail_URL parameters:@{@"item_catetory_id":self.CategoryDetailId,@"per_page":@"10",@"page":[NSString stringWithFormat:@"%zd",self.CategoryDetailPage]} success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog( @"%@",responseObject);
        
        if (![(NSArray *)responseObject[@"article_items"] isKindOfClass:[NSNull class]])
            
        {
        
            for (NSDictionary * dic in responseObject[@"article_items"])
            {
                CategoryDetailModel * model = [[CategoryDetailModel alloc] initWithDictionary:dic error:nil];
                model.pic_url = [NSString stringWithFormat:@"http://%@",dic[@"asset_imgs"][0][1][@"picture"][@"url"]] ;
                [self.CategoryDetailArr addObject:model];
            }
        
            [self.CategoryDetailCollectionView reloadData];
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
        
    }];
}


#pragma mark - back
- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.CategoryDetailArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(ZScreenWidth/2 - 5, ZScreenWidth/2+45);

 
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDetailCell * cell = [self.CategoryDetailCollectionView dequeueReusableCellWithReuseIdentifier:@"categoryDetailCell" forIndexPath:indexPath];
    if (self.CategoryDetailArr.count > 0)
    {
        [cell refreshUIWithModel:self.CategoryDetailArr[indexPath.row]];
    }
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
 
    return UIEdgeInsetsMake(0, 3, 0, 3);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDetailModel * model = self.CategoryDetailArr[indexPath.row];
    CategoryCellDetailController * ctl = [CategoryCellDetailController new];
    ctl.title = model.title;
    ctl.url = model.url;
    [self presentViewController:ctl animated:YES completion:nil];
}

//按钮动画
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == self.CategoryDetailCollectionView)
    {
        [UIView animateWithDuration:1 animations:^{
            
           _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight+15);
        }];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.CategoryDetailCollectionView)
    {
        [UIView animateWithDuration:1 animations:^{
            
            _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight-15);
        }];
    }

}

@end
