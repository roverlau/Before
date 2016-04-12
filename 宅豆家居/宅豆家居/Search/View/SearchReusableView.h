//
//  SearchReusableView.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchReusableView : UICollectionReusableView

@property (strong,nonatomic) UILabel * title;

- (void)refreshUIWith:(NSString *)title;

@end
