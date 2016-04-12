//
//  FourButtonCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "FourButtonCell.h"


@implementation FourButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame = CGRectMake(0, 0, ZScreenWidth, 80);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    NSArray * arr = @[@"零元特卖",@"天天刮奖",@"转发有喜",@"特卖商城"];
    for (NSInteger i = 0; i < 4; i++)
    {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 40, 40);
        btn.center = CGPointMake(ZScreenWidth / 8.0 * (i*2 + 1), self.frame.size.height/2.0 - 5);
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg",i+1]] forState:UIControlStateNormal];
        btn.tag = 10+i;
        
        [btn addTarget:self action:@selector(sendTag:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:btn];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
        label.center = CGPointMake(ZScreenWidth / 8.0 * (i*2 + 1), self.frame.size.height/2.0 + 25);
        label.text = arr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        [bgView addSubview:label];
    }
    [self.contentView addSubview:bgView];
}



- (void)sendTag:(UIButton *)btn
{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"fourButtonCell" object:self userInfo:@{@"tag":[NSString stringWithFormat:@"%zd",btn.tag]}];
}

@end
