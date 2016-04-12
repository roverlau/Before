//
//  HomeScrollViewModel.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HomeScrollViewModel.h"

@interface HomeScrollViewModel ()

@end

@implementation HomeScrollViewModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"imgId"}];
}

@end
