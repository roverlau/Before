//
//  CategoryModel.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ChildrenModel.h"

@interface CategoryModel : JSONModel

@property (copy,nonatomic) NSString<Optional> *cateId;
@property (copy,nonatomic) NSString<Optional> *level;
@property (copy,nonatomic) NSString<Optional> *name;
@property (strong,nonatomic) NSMutableArray<Optional>  * childrenDataArr;
@end
