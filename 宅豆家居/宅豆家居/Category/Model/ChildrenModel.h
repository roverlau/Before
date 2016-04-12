//
//  ChildrenModel.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ChildrenModel <NSObject>


@end

@interface ChildrenModel : JSONModel

@property (copy,nonatomic) NSString<Optional> *chilId; // 114,
@property (copy,nonatomic) NSString<Optional> *is_piblish; // true,
@property (copy,nonatomic) NSString<Optional> *level; // 1,
@property (copy,nonatomic) NSString<Optional> *lft; // 50,
@property (copy,nonatomic) NSString<Optional> *name; // @property (copy,nonatomic) NSString<Optional> *宠物天地@property (copy,nonatomic) NSString<Optional> *,
@property (copy,nonatomic) NSString<Optional> *parent_id; // 1,
@property (copy,nonatomic) NSString<Optional> *rgt; // 53
@property (copy,nonatomic) NSString<Optional> *pic_url;

@end
