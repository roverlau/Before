//
//  FactoryUI.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FactoryUI.h"

@implementation FactoryUI

//左侧选择按钮视图
+ (UIView *)createLeftButtonView
{
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(-60, 0, 60,ZScreenHeight)];
    NSArray * normalArr = @[@"action-black-button.png",@"action-gray-button.png",@"action-red-button.png"];
    NSArray * selectedArr = @[@"action-black-button-selected.png",@"action-gray-button-selected.png",@"action-red-button-selected.png"];
    for (NSInteger i = 0 ; i < 3; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, ZScreenHeight/4.0*(i+1) - 20, 40, 40);
        [btn setImage:[UIImage imageNamed:normalArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selectedArr[i]] forState:UIControlStateSelected];
        [leftView addSubview:btn];
        
    }
    return leftView;
}

//界面底层collectionView
+ (UICollectionView *)createCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, ZScreenHeight)collectionViewLayout:flowLayout];
    collectionView.allowsSelection = NO;
    collectionView.backgroundColor = [UIColor redColor];
    return collectionView;
}

//界面底层scrollView
+ (UIScrollView *)createScrollView
{
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, ZScreenHeight)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    
    return scrollView;
}


@end
