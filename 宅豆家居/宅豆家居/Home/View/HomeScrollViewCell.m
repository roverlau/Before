//
//  HomeScrollViewCell.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "HomeScrollViewCell.h"
#import "HomeScrollViewModel.h"

@implementation HomeScrollViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.frame = CGRectMake(0, 0, ZScreenWidth, 180);
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
    
    self.pageCtl = [UIPageControl new];
    _pageCtl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageCtl.pageIndicatorTintColor = [UIColor grayColor];
    _pageCtl.frame = CGRectMake(0, 0, 30, 10);
    _pageCtl.center = CGPointMake(ZScreenWidth/2, self.frame.size.height - 5);
    [self addSubview:_pageCtl];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sendOffset:)];
    [self.scrollView addGestureRecognizer:tap];
}

- (void)sendOffset:(UITapGestureRecognizer *)sender
{
   
    NSInteger index = self.scrollView.contentOffset.x/375;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"scrollViewOffset" object:self.scrollView userInfo:@{@"offset":[NSString stringWithFormat:@"%zd",index]}];
}

//自动翻页
- (void)nextPage
{
    NSInteger index = self.scrollView.contentOffset.x/ZScreenWidth;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake((index + 1)*ZScreenWidth, 0);
        self.pageCtl.currentPage = index;
    }];
    
    NSInteger last = (self.scrollView.contentSize.width-ZScreenWidth) / ZScreenWidth;
    if (index == last - 1)
    {
        self.scrollView.contentOffset = CGPointMake(ZScreenWidth, 0);
        self.pageCtl.currentPage = 0;
    }

}

- (void)refreshImagesWithimageArr:(NSArray *)imageArr
{
    
    self.scrollView.contentSize = CGSizeMake(ZScreenWidth * (imageArr.count + 2), self.frame.size.height);
    self.scrollView.contentOffset = CGPointMake(ZScreenWidth, 0);
    self.pageCtl.numberOfPages = imageArr.count;
    for (NSInteger i = 1;i < imageArr.count+1;i++)
    {
        
        HomeScrollViewModel * model = (HomeScrollViewModel *)imageArr[i - 1];
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * ZScreenWidth, 0, ZScreenWidth, self.frame.size.height)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgs]];
        [self.scrollView addSubview:imageView];
    }
    
    //无限滚动首尾图片
    UIImageView * firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, self.frame.size.height)];
    [firstImageView sd_setImageWithURL:[NSURL URLWithString:[(HomeScrollViewModel *)[imageArr lastObject] imgs]]];
    [self.scrollView addSubview:firstImageView];
    
    UIImageView * lastImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ZScreenWidth * (imageArr.count + 1), 0, ZScreenWidth, self.frame.size.height)];
    [lastImageView sd_setImageWithURL:[NSURL URLWithString:[(HomeScrollViewModel *)imageArr[0] imgs]]];
    [self.scrollView addSubview:lastImageView];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/ZScreenWidth;
    NSInteger last = (scrollView.contentSize.width-ZScreenWidth) / ZScreenWidth;
    if (index == last)
    {
        scrollView.contentOffset = CGPointMake(ZScreenWidth, 0);
        self.pageCtl.currentPage = 0;
    }
    else if (index == 0)
    {
        scrollView.contentOffset = CGPointMake((last - 1) * ZScreenWidth, 0);
        self.pageCtl.currentPage = last - 1;
    }
    else
    {
        self.pageCtl.currentPage = index - 1;
    }
}

@end
