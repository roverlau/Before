//
//  ResultPlanModel.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ResultPlanModel : JSONModel

@property (copy,nonatomic) NSString * img_url;

@property (copy,nonatomic) NSString * title;

@property (copy,nonatomic) NSString * resultPlanId;
@end
