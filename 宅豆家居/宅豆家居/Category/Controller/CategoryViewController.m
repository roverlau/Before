//
//  CategoryViewController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryViewController.h"
#import "CategoryModel.h"
#import "CategoryCell.h"
#import "CategoryReusableView.h"
#import "CategoryDetailController.h"

@interface CategoryViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//大模型
@property (strong,nonatomic) NSMutableArray * dataArr;

@end

@implementation CategoryViewController

- (NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initUI];
    
}

//数据
- (void)initData
{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager GET:Category_URL parameters:@{@"page":@"1"} success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        for (NSDictionary * dic in responseObject[@"item_categories"])
        {
            CategoryModel * cateModel = [[CategoryModel alloc] initWithDictionary:dic error:nil];
            
            for (NSDictionary * chilDic in dic[@"children"])
            {
                ChildrenModel * model = [[ChildrenModel alloc] initWithDictionary:chilDic error:nil];
                [model setValue:chilDic[@"avatar"][@"url"] forKey:@"pic_url"];
                [cateModel.childrenDataArr addObject:model];
            }
            [self.dataArr addObject:cateModel];
        }
        [self.collectionView reloadData];
        
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@",error);
        
    }];
}

- (void)initUI
{
    [self.tableView removeFromSuperview];
    self.layout.minimumLineSpacing = 1;
    self.layout.minimumInteritemSpacing = 1;
    //注册
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.collectionView.frame = CGRectMake(0, 20, ZScreenWidth, ZScreenHeight);
    [self registerReusableView];

};

- (void)registerReusableView
{
    [self.collectionView registerClass:[CategoryCell class] forCellWithReuseIdentifier:@"categoryCell"];
    [self.collectionView registerClass:[CategoryReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"categoryReusableView"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if ([(CategoryModel*)self.dataArr[section] childrenDataArr].count%4)
    {
        return [(CategoryModel*)self.dataArr[section] childrenDataArr].count/4*4+4;
    }
    return [(CategoryModel*)self.dataArr[section] childrenDataArr].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"categoryCell" forIndexPath:indexPath];
    cell.name.text = nil;
    cell.pic.image = nil;
    if ([self.dataArr[indexPath.section] childrenDataArr].count > indexPath.row)
    {
        [cell refreshUIWithModel:[(CategoryModel*)self.dataArr[indexPath.section] childrenDataArr][indexPath.row]];
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataArr.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ZScreenWidth/4.0-1, ZScreenWidth/4.0-1);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 0, 20, 0);
}

//段头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString: UICollectionElementKindSectionHeader])
    {
        CategoryReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"categoryReusableView" forIndexPath:indexPath];
        [headerView refreshUIWithModel:self.dataArr[indexPath.section]];
        return headerView;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ZScreenWidth, 30);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryDetailController * ctl = [CategoryDetailController new];
    CategoryModel * cateModel = self.dataArr[indexPath.section];
    ChildrenModel * model = cateModel.childrenDataArr[indexPath.row];
    ctl.CategoryDetailId = model.chilId;
    [self presentViewController:ctl animated:YES completion:nil];
}

@end
