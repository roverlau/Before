//
//  ResultObjectDetailController.m
//  宅豆家居
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ResultObjectDetailController.h"

@interface ResultObjectDetailController ()<UIScrollViewDelegate>

@property (strong,nonatomic) UIWebView * cellDetailView;

@property (strong,nonatomic) NSURLRequest * request;

@property (strong,nonatomic) UIView * bottomView;

@end

@implementation ResultObjectDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.cellDetailView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ZScreenWidth, ZScreenHeight)];
    _cellDetailView.scrollView.delegate = self;
    [self.view addSubview:_cellDetailView];
    
    [self showContent];
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ZScreenHeight - 30, ZScreenWidth, 30)];
    
    //关闭btn
    UIButton * shutdownBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shutdownBtn setBackgroundImage:[UIImage imageNamed:@"review_cancel"] forState:UIControlStateNormal];
    shutdownBtn.frame = CGRectMake(0, 0, 25, 25);
    shutdownBtn.center = CGPointMake(ZScreenWidth/2, 15);
    [shutdownBtn addTarget:self action:@selector(shutdown) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:shutdownBtn];
    
    //分享btn
    UIButton * shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setBackgroundImage:[UIImage imageNamed:@"share_normal"] forState:UIControlStateNormal];
    shareBtn.frame = CGRectMake(0, 0, 25, 25);
    shareBtn.center = CGPointMake(ZScreenWidth/6*5, 15);
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:shareBtn];
    
    //返回btn
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_backItem"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(0, 0, 25, 25);
    backBtn.center = CGPointMake(ZScreenWidth/6, 15);
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:backBtn];
    
    [self.view addSubview:_bottomView];
}

- (void)share
{
    [UMSocialSnsService presentSnsIconSheetView:self appKey:nil shareText:[NSString stringWithFormat:@"%@ : %@",self.title,self.url]shareImage:nil shareToSnsNames:@[UMShareToSina,UMShareToQzone] delegate:nil];
}


- (void)showContent
{
    self.request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [self.cellDetailView loadRequest:_request];
}

- (void)goBack
{
    [self.cellDetailView goBack];
}

- (void)shutdown
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:1 animations:^{
        self.bottomView.frame = CGRectMake(0, ZScreenHeight, ZScreenWidth, 30);
        
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    [UIView animateWithDuration:1 animations:^{
        self.bottomView.frame = CGRectMake(0, ZScreenHeight - 30, ZScreenWidth, 30);
        
    }];
}


@end
