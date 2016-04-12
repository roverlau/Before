//
//  CategoryModel.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _childrenDataArr = [NSMutableArray new];
    }
    return self;
}

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"cateId"}];
    
}

@end
