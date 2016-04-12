//
//  SearchCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SearchCell.h"

@implementation SearchCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, ZScreenWidth/7, self.frame.size.height/2)];
    img.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    img.image = [UIImage imageNamed:@"btn_normal"];
    [self.contentView addSubview:img];
    
    self.item = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, img.frame.size.width, img.frame.size.height/2)];
    _item.center = CGPointMake(img.frame.size.width/2, img.frame.size.height/2);
    _item.textAlignment = NSTextAlignmentCenter;
    _item.font = [UIFont systemFontOfSize:10];
    [img addSubview:_item];
}

- (void)refreshUIWith:(NSString *)item
{
    self.item.text = item;
}

@end
