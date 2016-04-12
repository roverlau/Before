//
//  SearchResultController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchResultController.h"
#import "FactoryUI.h"
#import "ResultObjectCell.h"
#import "ResultObjectModel.h"
#import "ResultPlanCell.h"
#import "ResultPlanModel.h"
#import "ResultObjectDetailController.h"
#import "ResultPlanDetailController.h"

@interface SearchResultController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UIAlertViewDelegate>

@property (strong,nonatomic) UIScrollView * searchScr;

@property (strong,nonatomic) UICollectionView * objCollectionView;

@property (strong,nonatomic) UICollectionView * planCollectionView;

@property (strong,nonatomic) UICollectionViewFlowLayout * objLayout;

@property (strong,nonatomic) UICollectionViewFlowLayout * planLayout;

@property (strong,nonatomic) UIButton * backBtn;
@end

@implementation SearchResultController
//懒加载
- (NSMutableArray *)planArr
{
    if (!_planArr)
    {
        _planArr = [NSMutableArray new];
    }
    return _planArr;
}

- (NSMutableArray *)objectArr
{
    if (!_objectArr)
    {
        _objectArr = [NSMutableArray new];
    }
    return _objectArr;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

#pragma mark - UI相关
- (void)initUI
{
    
    //底层ScrollView
    self.searchScr = [FactoryUI createScrollView];
    [self.view addSubview:_searchScr];
    _searchScr.delegate = self;
    _searchScr.pagingEnabled = YES;
    _searchScr.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    _searchScr.contentSize = CGSizeMake(2 * ZScreenWidth, ZScreenHeight);
    
    //单品界面
    self.objLayout = [UICollectionViewFlowLayout new];
    self.objCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 45, ZScreenWidth, ZScreenHeight-45) collectionViewLayout:_objLayout];
    _objCollectionView.delegate = self;
    _objCollectionView.dataSource = self;
    _objLayout.minimumInteritemSpacing = 3;
    _objLayout.minimumLineSpacing = 3;
    _objCollectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [_searchScr addSubview:_objCollectionView];
    
    //攻略界面
    self.planLayout = [UICollectionViewFlowLayout new];
    self.planCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(ZScreenWidth, 45, ZScreenWidth, ZScreenHeight-45) collectionViewLayout:_planLayout];
    _planLayout.minimumLineSpacing = 3;
    _planCollectionView.delegate = self;
    _planCollectionView.dataSource = self;
    _planCollectionView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [_searchScr addSubview:_planCollectionView];
    
    //顶部视图
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, 45)];
    _topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_topView];
    
    self.objectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _objectBtn.frame = CGRectMake(0, 20, ZScreenWidth/2, 25);
    [_objectBtn setTitle:@"单品" forState:UIControlStateNormal];
    _objectBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_objectBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:_objectBtn];
    
    self.planBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _planBtn.frame = CGRectMake(ZScreenWidth/2, 20, ZScreenWidth/2, 25);
    [_planBtn setTitle:@"攻略" forState:UIControlStateNormal];
    [_planBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    _planBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.topView addSubview:_planBtn];
    
    //btn颜色
    [self.objectBtn setTitleColor:[UIColor colorWithRed:106/255.0 green:194/255.0 blue:142/255.0 alpha:1] forState:UIControlStateNormal];
    [self.planBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    //顶部中线
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(ZScreenWidth/2, 23, 1, 18)];
    line.backgroundColor = [UIColor blackColor];
    [self.topView addSubview:line];
    
    //返回btn
    self.backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setBackgroundImage:[UIImage imageNamed:@"icon_search_selected"] forState:UIControlStateNormal];
//    [backBtn setTitle:@"go back" forState:UIControlStateNormal];
    _backBtn.frame = CGRectMake(0, 0, 25, 25);
    _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight-15);
    [_backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backBtn];
    
    //注册复用View
    [self registerReusableView];
    

}
- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//注册复用
- (void)registerReusableView
{
    [self.objCollectionView registerClass:[ResultObjectCell class] forCellWithReuseIdentifier:@"resultObjectCell"];
    [self.planCollectionView registerClass:[ResultPlanCell class] forCellWithReuseIdentifier:@"resultPlanCell"];
}

- (void)change:(UIButton *)btn
{
    if (btn == self.objectBtn)
    {
        self.searchScr.contentOffset = CGPointMake(0, 0);
        [self.objectBtn setTitleColor:[UIColor colorWithRed:106/255.0 green:194/255.0 blue:142/255.0 alpha:1] forState:UIControlStateNormal];
        [self.planBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else
    {
        self.searchScr.contentOffset = CGPointMake(ZScreenWidth, 0);
        [self.planBtn setTitleColor:[UIColor colorWithRed:106/255.0 green:194/255.0 blue:142/255.0 alpha:1] forState:UIControlStateNormal];
        [self.objectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

#pragma mark - 数据相关
- (void)initData
{
    [self refreshData];
    
    [self searchFromNet];
}

- (void)searchFromNet
{
    [self searchObjFromNet];
    [self searchPlanFromNet];
}

- (void)searchObjFromNet
{
    
    //单品
    
    NSString * urlObj = [NSString stringWithFormat:@"%@?search=%@&&page=%@",SearchResultObject_URL,_searchKey,[NSString stringWithFormat:@"%zd",_objPage]];
    
    /*
     search 要搜索的关键字
     */
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlObj parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         
         NSLog(@"%@",responseObject);
     
         if ([(NSArray *)responseObject[@"article_items"] isKindOfClass:[NSNull class]])
         {
             UIAlertView * view = [[UIAlertView alloc] initWithTitle:@"哎呀,好像没嘞" message:@"我们会努力扩大搜索范围滴~加油" delegate:self cancelButtonTitle:@"留在当前" otherButtonTitles:@"回去试试别的关键字", nil];
             [view show];
//             [self goBack];
         }
         else
         {
             for (NSDictionary * dic in responseObject[@"article_items"])
             {
                 ResultObjectModel * model = [[ResultObjectModel alloc] initWithDictionary:dic error:nil];
                 model.pic_url = [NSString stringWithFormat:@"http://%@",dic[@"asset_imgs"][0][1][@"picture"][@"url"]] ;
                 [self.objectArr addObject:model];
             }
             [self.objCollectionView reloadData];
         }
         
         
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
         
     }];
    
}

- (void)searchPlanFromNet
{
    /*
     search 要搜索的关键字
     */
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //攻略
    
    
    //    攻略:
    //http://www.zhaidou.com/article/api/articles/search?search=%E6%B2%99%E5%8F%91
    
    NSString * urlPlan = [NSString stringWithFormat:@"%@?search=%@&&page=%@",SearchResultPlan_URL,_searchKey,[NSString stringWithFormat:@"%zd",_planPage]];
    
    [manager POST:urlPlan parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"%@",responseObject);
         if (![(NSArray *)responseObject[@"articles"] isKindOfClass:[NSNull class]])
         
         {
             for (NSDictionary * dic in responseObject[@"articles"])
             {
                 ResultPlanModel * model = [[ResultPlanModel alloc] initWithDictionary:dic error:nil];
                 [self.planArr addObject:model];
             }
             [self.planCollectionView reloadData];
             
         }
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"%@",error);
         
     }];

}


#pragma mark - 上下拉刷新
- (void)refreshData
{
    self.objCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.objPage++;
        [self searchObjFromNet];
        [self.objCollectionView.footer endRefreshing];
    }];
    
    self.planCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        self.planPage++;
        [self searchPlanFromNet];
        [self.planCollectionView.footer endRefreshing];
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    if (collectionView == _objCollectionView)
    {
        return self.objectArr.count;
    }
    return self.planArr.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == _objCollectionView)
    {
        return CGSizeMake(ZScreenWidth/2 - 5, ZScreenWidth/2 + 45);
    }
    return CGSizeMake(ZScreenWidth - 10, 150);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_objCollectionView == collectionView)
    {
        ResultObjectCell * cell = [self.objCollectionView dequeueReusableCellWithReuseIdentifier:@"resultObjectCell" forIndexPath:indexPath];
        [cell refreshUIWithModel:self.objectArr[indexPath.row]];
        return cell;
    }
    
    ResultPlanCell * cell = [self.planCollectionView dequeueReusableCellWithReuseIdentifier:@"resultPlanCell" forIndexPath:indexPath];
    [cell refreshUIWithModel:self.planArr[indexPath.row]];
    return cell;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (_objCollectionView == collectionView)
    {
        return UIEdgeInsetsMake(0, 3, 0, 3);
    }
    return UIEdgeInsetsMake(0, 3, 0, 3);
}



#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //按钮动画
    if (scrollView == self.objCollectionView | scrollView == self.planCollectionView)
    {
        [UIView animateWithDuration:1 animations:^{
            
            _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight-15);
        }];
        return;
    }
    if (scrollView.contentOffset.x == 0)
    {
        [self.objectBtn setTitleColor:[UIColor colorWithRed:106/255.0 green:194/255.0 blue:142/255.0 alpha:1] forState:UIControlStateNormal];
        [self.planBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    else
    {
        [self.planBtn setTitleColor:[UIColor colorWithRed:106/255.0 green:194/255.0 blue:142/255.0 alpha:1] forState:UIControlStateNormal];
        [self.objectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_objCollectionView == collectionView)
    {
        ResultObjectDetailController * ctl = [ResultObjectDetailController new];
        ctl.url = ((ResultObjectModel *)self.objectArr[indexPath.row]).url;
        ctl.title = ((ResultObjectModel *)self.objectArr[indexPath.row]).title;
        [self presentViewController:ctl animated:YES completion:nil];
    }
    else
    {
        ResultPlanDetailController * ctl = [ResultPlanDetailController new];
        ctl.resultPlanId = ((ResultPlanModel *)self.planArr[indexPath.row]).resultPlanId;
        ctl.title = ((ResultPlanModel *)self.planArr[indexPath.row]).title;
        [self presentViewController:ctl animated:YES completion:nil];
    }
}

//按钮动画
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == self.objCollectionView | scrollView == self.planCollectionView)
    {
        [UIView animateWithDuration:1 animations:^{
            
            _backBtn.center = CGPointMake(ZScreenWidth/2, ZScreenHeight+15);
        }];
    }
    
}

//alertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self goBack];
    }
}

@end
