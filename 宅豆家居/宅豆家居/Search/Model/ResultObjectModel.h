//
//  ResultObjectModel.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ResultObjectModel : JSONModel


@property (copy,nonatomic) NSString * price;

@property (copy,nonatomic) NSString * title;

@property (copy,nonatomic) NSString * url;

@property (copy,nonatomic) NSString<Optional> * pic_url;


@end
