//
//  NetInterface.h
//  宅豆家居
//
//  Created by qianfeng on 15/10/25.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef _____NetInterface_h
#define _____NetInterface_h

#pragma mark - 首页

#pragma mark - ScrollView
/*
 status 2
 page 1
 */
#define HomeScrollView_URL @"http://www.zhaidou.com/special_mall/api/sales/sale_banner"
//?status=2&page=1

#pragma mark - 第一个cell
/*
 page 1
 */
#define HomeAd_URL @"http://www.zhaidou.com/special_mall/api/sales/new_sale"

#pragma mark - 后续cell
/*
 page 1
 */
#define HomeCell_URL @"http://www.zhaidou.com/article/api/articles?per_page=10"
//&page=1

#pragma mark - 单品
/*
 page 1
 */
#define Category_URL @"http://www.zhaidou.com/article/api/item_categories"
//?page=1

#pragma mark - 单品详情
/*
 item_catetory_id 为单品id值
 per_page 10
 page 1
 */
#define CategoryDetail_URL @"http://www.zhaidou.com/article/api/article_items"
//?item_catetory_id=2&per_page=10&page=1

#pragma mark - 搜索
/*
 page 1
 需要 实现搜索历史模块
 */
#define Search_URL @"http://www.zhaidou.com/article/api/articles/hot_search"
//?page=1

#pragma mark - searchURL
/*
 search 要搜索的关键字
 page 1
 */
//单品
#define SearchResultObject_URL @"http://www.zhaidou.com/article/api/article_items/search"
//?search=%E5%8A%9E%E5%85%AC

//攻略
#define SearchResultPlan_URL @"http://www.zhaidou.com/article/api/articles/search"

//攻略详情
#define ResultPlanPrefix_URL @"http://www.zhaidou.com/article/articles/"
#define ResultPlanSuffix_URL @"open=app"

#pragma mark - homeCell详情
/*
 URL需要拼接
 例如645为cell中id值
 open app
 */
#define HomeCellDetailPrefix_URL @"http://www.zhaidou.com/article/articles/"
//645
#define HomeCellDetailSuffix_URL @"?open=app"

#pragma mark - 零元特卖banner
/*
 status 0
 page 1
 */
#define ZeroSaleBanner_URL @"http://www.zhaidou.com/special_mall/api/sales/sale_banner?status=0"
//&page=1

#pragma mark - 零元特卖
/*
 page 1
 */
#define ZeroSale_URL @"http://www.zhaidou.com/special_mall/api/sales/zero_sale"
//?page=1

#pragma mark - 天天刮奖
/*
 html 使用UIWebView
 */
#define Lotteries_URL @"http://www.zhaidou.com/lotteries"

#pragma mark - 转发有喜
/*
 html 使用UIWebView
 */
#define Retweet_URL @"http://www.zhaidou.com/retweet"

#pragma mark - 特卖商城banner
/*
 status 1
 page 1
 */
#define SalesBanner_URL @"http://www.zhaidou.com/special_mall/api/sales/sale_banner"
//?status=1&page=1

#pragma mark - 特卖商城
/*
 sale_cate 0
 page  1
 */
#define Sales_URL @"http://www.zhaidou.com/special_mall/api/sales"
//?sale_cate=0&page=1

#endif

