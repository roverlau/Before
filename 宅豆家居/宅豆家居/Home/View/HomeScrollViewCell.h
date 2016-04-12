//
//  HomeScrollViewCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScrollViewCell : UITableViewCell<UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView * scrollView;

@property (strong,nonatomic) UIPageControl * pageCtl;

@property (strong,nonatomic) NSTimer * timer;
- (void)refreshImagesWithimageArr:(NSArray *)imageArr;

@end
