//
//  ChildrenModel.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ChildrenModel.h"

@implementation ChildrenModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"chilId"}];
    
}


@end
