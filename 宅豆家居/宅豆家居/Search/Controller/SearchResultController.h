//
//  SearchResultController.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultController : UIViewController

@property (copy,nonatomic) NSString * searchKey;

@property (assign,nonatomic) NSInteger objPage;

@property (assign,nonatomic) NSInteger planPage;

@property (strong,nonatomic) NSMutableArray * objectArr;

@property (strong,nonatomic) NSMutableArray * planArr;

@property (strong,nonatomic) UIView * topView;

@property (strong,nonatomic) UIButton * objectBtn;

@property (strong,nonatomic) UIButton * planBtn;
@end
