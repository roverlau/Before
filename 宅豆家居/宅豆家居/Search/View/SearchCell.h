//
//  SearchCell.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCell : UICollectionViewCell

@property (strong,nonatomic) UILabel * item;

- (void)refreshUIWith:(NSString *)item;

@end
