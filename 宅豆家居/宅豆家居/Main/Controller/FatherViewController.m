//
//  FatherViewController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FatherViewController.h"
#import "FactoryUI.h"
#import "AppDelegate.h"

@interface FatherViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end

@implementation FatherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    self.scrollView = [FactoryUI createScrollView];
    _scrollView.contentSize = CGSizeMake(ZScreenWidth + 0.5, ZScreenHeight);
    _scrollView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];

    [self.view addSubview:self.scrollView];
    _scrollView.delegate = self;
    
    //左边按钮
    NSArray * normalArr = @[@"icon_tabbar_homepage",@"icon_tabbar_merchant_normal",@"icon_search"];
    NSArray * selectedArr =@[@"icon_tabbar_homepage_selected",@"icon_tabbar_merchant_selected",@"icon_search_selected"];
    //左边View
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(-60, 0, 60,ZScreenHeight)];
    
    self.homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.homeBtn.frame = CGRectMake(10, ZScreenHeight/4.0 - 20, 40, 40);
    [self.homeBtn setImage:[UIImage imageNamed:normalArr[0]] forState:UIControlStateNormal];
    [self.homeBtn setImage:[UIImage imageNamed:selectedArr[0]] forState:UIControlStateSelected];
    [leftView addSubview:self.homeBtn];
    
    self.designBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.designBtn.frame = CGRectMake(10, ZScreenHeight/4.0*2 - 20, 40, 40);
    [self.designBtn setImage:[UIImage imageNamed:normalArr[1]] forState:UIControlStateNormal];
    [self.designBtn setImage:[UIImage imageNamed:selectedArr[1]] forState:UIControlStateSelected];
    [leftView addSubview:self.designBtn];

    self.categoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.categoryBtn.frame = CGRectMake(10, ZScreenHeight/4.0*3 - 20, 40, 40);
    [self.categoryBtn setImage:[UIImage imageNamed:normalArr[2]] forState:UIControlStateNormal];
    [self.categoryBtn setImage:[UIImage imageNamed:selectedArr[2]] forState:UIControlStateSelected];
    [leftView addSubview:self.categoryBtn];
    [self.scrollView addSubview:leftView];
    
//    //右边按钮
//    NSArray * normalArrR = @[@"icon_search",@"icon_tabbar_mine"];
//    NSArray * selectedArrR =@[@"icon_search_selected",@"icon_tabbar_mine_selected"];
//    //右边View
//    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(ZScreenWidth, 0, 60,ZScreenHeight)];
//    
//    self.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.searchBtn.frame = CGRectMake(10, ZScreenHeight/4.0 - 20, 40, 40);
//    [self.searchBtn setImage:[UIImage imageNamed:normalArrR[0]] forState:UIControlStateNormal];
//    [self.searchBtn setImage:[UIImage imageNamed:selectedArrR[0]] forState:UIControlStateSelected];
//    [rightView addSubview:self.searchBtn];
//    
//    self.meBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.meBtn.frame = CGRectMake(10, ZScreenHeight/4.0*2 - 20, 40, 40);
//    [self.meBtn setImage:[UIImage imageNamed:normalArrR[1]] forState:UIControlStateNormal];
//    [self.meBtn setImage:[UIImage imageNamed:selectedArrR[1]] forState:UIControlStateSelected];
//    [rightView addSubview:self.meBtn];
//    [self.scrollView addSubview:rightView];
   
    
    //tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.scrollView.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:_tableView];
   
    
    
    //collectionView
    self.layout = [UICollectionViewFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.scrollView.frame collectionViewLayout:_layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self.scrollView addSubview:_collectionView];
    
   
}


#pragma mark = UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[UICollectionView class]] || [scrollView isKindOfClass:[UITableView class]])
    {
        return;
    }

    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    AppDelegate * dele = (AppDelegate *)[UIApplication sharedApplication].delegate;

    if ([scrollView isKindOfClass:[UICollectionView class]] || [scrollView isKindOfClass:[UITableView class]])
    {
        return;
    }
    CGFloat offset = scrollView.contentOffset.x;
    if ( -60 <= offset && offset < -45)
    {
        dele.tabbarCtl.selectedIndex = 0;
    }
    else if (-60 > offset && -75 <= offset)
    {
        dele.tabbarCtl.selectedIndex = 1;
    }
    else if(-75 > offset && -90 <= offset)
    {
        dele.tabbarCtl.selectedIndex = 2;
    }
//    else if (60 > offset && 45 <= offset)
//    {
//        dele.tabbarCtl.selectedIndex = 3;
//    }
//    else if(-75 > offset && -90 <= offset)
//    {
//        dele.tabbarCtl.selectedIndex = 2;
//    }

    [scrollView removeObserver:self forKeyPath:@"contentOffset"];
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.scrollView)
    {
        CGFloat offset = [change[@"new"] CGPointValue].x;
        if (offset > -50 && offset <= 0)
        {
            [self.homeBtn setSelected:NO];
            [self.designBtn setSelected:NO];
            [self.categoryBtn setSelected:NO];
        }
        else if ( -60 <= offset && offset < -45)
        {
            [self.homeBtn setSelected:YES];
            [self.designBtn setSelected:NO];
            [self.categoryBtn setSelected:NO];
        }
        else if (-60 > offset && -75 <= offset)
        {
            [self.homeBtn setSelected:NO];
            [self.designBtn setSelected:YES];
            [self.categoryBtn setSelected:NO];
        }
        else if(-75 > offset && -90 <= offset)
        {
            [self.homeBtn setSelected:NO];
            [self.designBtn setSelected:NO];
            [self.categoryBtn setSelected:YES];
        }
//        else if (60 > offset && 45 <= offset)
//        {
//            [self.searchBtn setSelected:YES];
//            [self.meBtn setSelected:NO];
//        }
//        else if (75 > offset && 60 <= offset)
//        {
//            [self.searchBtn setSelected:NO];
//            [self.meBtn setSelected:YES];
//        }

    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeZero;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
@end
