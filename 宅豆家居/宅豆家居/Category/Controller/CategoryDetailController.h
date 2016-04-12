//
//  CategoryDetailController.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryDetailController : UIViewController
@property (copy,nonatomic) NSString * CategoryDetailId;
@property (assign,nonatomic) NSInteger CategoryDetailPage;
@property (strong,nonatomic) NSMutableArray * CategoryDetailArr;

@end
