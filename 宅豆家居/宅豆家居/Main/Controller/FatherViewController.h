//
//  FatherViewController.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FatherViewController : UIViewController
//底层scrollView
@property (strong,nonatomic) UIScrollView * scrollView;

@property (strong,nonatomic) UITableView * tableView;

@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout * layout;
//左侧按钮
@property (strong,nonatomic) UIButton * homeBtn;
@property (strong,nonatomic) UIButton * designBtn;
@property (strong,nonatomic) UIButton * categoryBtn;
//右侧按钮
@property (strong,nonatomic) UIButton * searchBtn;
@property (strong,nonatomic) UIButton * meBtn;
@end
