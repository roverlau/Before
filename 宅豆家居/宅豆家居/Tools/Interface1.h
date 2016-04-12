//
//  Interface.h
//  Interface
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef Interface_Interface_h
#define Interface_Interface_h

#pragma mark - 首页

#pragma mark - ScrollView
#if 0
/*
    status 2
    page 1
 */
 http://www.zhaidou.com/special_mall/api/sales/sale_banner?status=2&page=1
{
    "sale_banners": [{
        "id": 34,
        "title": null,
        "r_type": 3,
        "r_value": "1561",
        "imgs": "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/34/f3ccdd27d2000e3f9255a7e3e2c48800.jpg",
        "banner_type": "2"
    }, {
        "id": 40,
        "title": null,
        "r_type": 0,
        "r_value": "",
        "imgs": "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/40/2dfad1eea3c47a97c1debc0732ca7f31.jpg",
        "banner_type": "2"
    }, {
        "id": 41,
        "title": null,
        "r_type": 3,
        "r_value": "1553",
        "imgs": "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/41/1b7a965221838b45c67edb5d55dd86ae.jpg",
        "banner_type": "2"
    }, {
        "id": 42,
        "title": null,
        "r_type": 3,
        "r_value": "1646",
        "imgs": "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/42/799bad5a3b514f096e69bbc4a7896cd9.jpg",
        "banner_type": "2"
    }]
}

#pragma mark - scrollView详情
/*
    URL需要拼接
    例如1646为scrollview中r_value
    page 1
 */
http://www.zhaidou.com/special_mall/api/merchandises/1646?page=1
{
    "merchandise": {
        "id": 1646,
        "title": "原木森系文艺墙上置物架",
        "designer": "很有文艺逼格的置物架，放在床头超方便，非常漂亮，里面的天然树枝很有质感，小细节也处理得很好，没有什么毛糙的感觉。",
        "total": 10,
        "total_count": 2.0,
        "sale_cate": 0,
        "price": 39.0,
        "cost_price": 130.0,
        "discount": 3.0,
        "start_time": "2015-10-14T00:00:00.000+08:00",
        "end_time": "2015-11-13T00:00:00.000+08:00",
        "is_publish": true,
        "descriptions": [{
            "id": 5106,
            "title": "规格",
            "value": "宽23*高22*深15.5"
        }, {
            "id": 5107,
            "title": "温馨提示",
            "value": "灯光不同和分辨率参数不同，实物和图片会有微小差异，请务必以实物为主"
        }, {
            "id": 5108,
            "title": "数量",
            "value": "1个"
        }, {
            "id": 5109,
            "title": "特别申明",
            "value": "【包邮：本商品每人限购一件，部分移动设备会显示邮费，但实际支付免邮费】"
        }, {
            "id": 5110,
            "title": "发货时间",
            "value": "24小时内发货，16点前的订单当日发货"
        }, {
            "id": 5111,
            "title": "退款时间",
            "value": "24小时内处理已申请退款，资金原路退回"
        }],
        "specifications": [{
            "id": 1866,
            "title": "墙上置物架",
            "count": 2,
            "price": 39.0,
            "cost_price": 130.0
        }],
        "imgs": [{
            "id": 7800,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7800/30e62fddc14c05988b44e7c02788e187.jpg"
        }, {
            "id": 7801,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7801/ae566253288191ce5d879e51dae1d8c3.jpg"
        }, {
            "id": 7802,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7802/62bf1edb36141f114521ec4bb4175579.jpg"
        }, {
            "id": 7803,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7803/8df7b73a7820f4aef47864f2a6c5fccf.jpg"
        }, {
            "id": 7804,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7804/9414a8f5b810972c3c9a0e2860c07532.jpg"
        }, {
            "id": 7805,
            "url": "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/7805/edab7ba7e203cd7576d1200465194ea8.jpg"
        }]
    }
}


#pragma mark - 第一个cell
/*
    page 1
 */
http://www.zhaidou.com/special_mall/api/sales/new_sale?page=1

{
    "sales": [{
        "id": 90,
        "banner": "http://www.zhaidou.com/uploads/sale/sale/banner/90/cb6b55c192e33dc66d53ce36711cfa1d.jpg",
        "tags": "3折起",
        "title": "一人食，不孤独的食物美学！",
        "start_time": "2015-10-21T00:00:00.000+08:00",
        "end_time": "2015-11-20T00:00:00.000+08:00",
        "day": 30,
        "over_day": 29
    }],
    "meta": {
        "count": 1,
        "page": 1,
        "size": 10
    }
}

#pragma mark - 第一个cell详情
/*
    URL需要拼接
    例如90为cell中id值
    page 1
 */
http://www.zhaidou.com/special_mall/api/sales/90?page=1

#pragma mark - 后续cell
/*
    page 1
 */
http://www.zhaidou.com/article/api/articles?per_page=10&page=1

{
    "articles": [{
        "id": 648,
        "title": "扫货清单：“泰”不一样的零食",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/648/627558992e5d2358d43d6cdb081c6d6b.jpg",
        "is_new": true,
        "reviews": 14072
    }, {
        "id": 647,
        "title": "MUJI床品，赠你柔软睡眠时光",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/647/234ab231f9581f71bb2fd5bb28cc748c.jpg",
        "is_new": true,
        "reviews": 35672
    }, {
        "id": 646,
        "title": "懒人桌|和我比懒，你就输了！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/646/ef9fdeca6ecd202a727fa909da655e1d.jpg",
        "is_new": false,
        "reviews": 37654
    }, {
        "id": 644,
        "title": "秋季养生，达人说要喝这些！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/644/c31aadee6c573ac6f4e10ee380dc8f50.jpg",
        "is_new": false,
        "reviews": 38108
    }, {
        "id": 645,
        "title": "碉堡了！插座还有这样的功能！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/645/3913e4a26425e200825a21b6b28fa4d7.jpg",
        "is_new": false,
        "reviews": 34750
    }, {
        "id": 643,
        "title": "边几 | 要美也要能收！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/643/dcf7950c1ae28298e945b15192d49d93.jpg",
        "is_new": false,
        "reviews": 38509
    }, {
        "id": 642,
        "title": "不给链接的厨房神器都是耍流氓！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/642/dcf7950c1ae28298e945b15192d49d93.jpg",
        "is_new": false,
        "reviews": 30659
    }, {
        "id": 641,
        "title": "“美味”文具 | 我敢打赌，你想咬我一口！",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/641/dcf7950c1ae28298e945b15192d49d93.jpg",
        "is_new": false,
        "reviews": 32858
    }, {
        "id": 638,
        "title": "美味罐头购买指南",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/638/dc1f76d19a844776d9e9a9f7621b68af.jpg",
        "is_new": false,
        "reviews": 38015
    }, {
        "id": 639,
        "title": "冲咖啡的正确姿势，就是要地道又温暖",
        "img_url": "http://www.zhaidou.com/uploads/article/article/asset_img/639/dc1f76d19a844776d9e9a9f7621b68af.jpg",
        "is_new": false,
        "reviews": 33528
    }],
    "meta": {
        "count": 603,
        "page": 1,
        "size": 10
    }
}

#pragma mark - 后续cell详情
/*
    URL需要拼接
    例如645为cell中id值
    open app
 */
http://www.zhaidou.com/article/articles/645?open=app
#pragma mark - 零元特卖banner
/*
    status 0
    page 1
 */
http://www.zhaidou.com/special_mall/api/sales/sale_banner?status=0&page=1
{
    "sale_banners" : [
                      {
                          "banner_type" : "0",
                          "id" : 39,
                          "imgs" : "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/39/76d38dcd438bf6b139bc9886ef356963.jpg",
                          "r_type" : 0,
                          "r_value" : "",
                          "title" : null
                      }
                      ]
}

#pragma mark - 零元特卖
/*
    page 1
 */
http://www.zhaidou.com/special_mall/api/sales/zero_sale?page=1

{
    "meta" : {
        "count" : 22,
        "page" : 1,
        "size" : 10
    },
    "sale" : {
        "end_time" : "2015-10-23T00:00:00.000+08:00",
        "id" : 97,
        "merchandises" : [
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2006,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10302/thumb_b21f0bedce1dfeee7e158f1a8888beab.jpg",
                              "percentum" : 0,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "白色陶瓷多肉花盆",
                              "total" : 2,
                              "total_count" : 0
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2001,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10263/thumb_032b2cc936860b03048302d991c3498f.jpg",
                              "percentum" : 75,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "棉麻墙壁小挂袋 ",
                              "total" : 12,
                              "total_count" : 9
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2004,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10284/thumb_64b8299d1597b8a5c7b9cb9c88642f6c.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "多功能木质收纳笔筒",
                              "total" : 9,
                              "total_count" : 9
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2005,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10293/thumb_eb935669c45405844c35aafbd5fe43d7.jpg",
                              "percentum" : 92,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "棉麻布艺收纳盒",
                              "total" : 14,
                              "total_count" : 13
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2009,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10344/thumb_fd107bec4a5eaaed6441a46280dcc929.jpg",
                              "percentum" : 31,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "文艺小清新创意装饰画",
                              "total" : 16,
                              "total_count" : 5
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2010,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10354/thumb_3571adc2900d18ca7bbb29ffef49e706.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "北欧硅胶汤勺架[不含勺]",
                              "total" : 6,
                              "total_count" : 6
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2011,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10360/thumb_4ede289aea6dc8ae16bc0bd78688af5c.jpg",
                              "percentum" : 90,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "纯手工麋鹿挂钩",
                              "total" : 11,
                              "total_count" : 10
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2012,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10368/thumb_3962e39925f070cfbba6b535fe9098da.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "马口铁眼镜盒",
                              "total" : 6,
                              "total_count" : 6
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2013,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10375/thumb_e1c9bf1a74ce6a40d277f8adc4d2de88.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "小松鼠米饭勺",
                              "total" : 11,
                              "total_count" : 11
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2021,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10458/thumb_e3e6f22244e557f1758d397a98734145.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "创意居家切葱丝刀片",
                              "total" : 10,
                              "total_count" : 10
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2032,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10561/thumb_af9b82a1b9683d5734db895886c002c0.jpg",
                              "percentum" : 42,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "田园玻璃罩小摆件",
                              "total" : 14,
                              "total_count" : 6
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2014,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10386/thumb_86a29b6182b76ebc3193440024a1f412.jpg",
                              "percentum" : 73,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "多功能s型防滑裤架",
                              "total" : 30,
                              "total_count" : 22
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2033,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10565/thumb_59a41ab8382a1a9d74bf993e8135cb46.jpg",
                              "percentum" : 92,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "创意家居洗米器",
                              "total" : 26,
                              "total_count" : 24
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2028,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10532/thumb_baaf94542a40d7deb9a8a917acb1b150.jpg",
                              "percentum" : 0,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "北欧猫头鹰水杯[不带盖]",
                              "total" : 3,
                              "total_count" : 0
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2016,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10401/thumb_f3ccdd27d2000e3f9255a7e3e2c48800.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "书本型礼品收纳盒",
                              "total" : 20,
                              "total_count" : 20
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2018,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10417/thumb_64b8299d1597b8a5c7b9cb9c88642f6c.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "日式棉麻布艺小挂袋",
                              "total" : 2,
                              "total_count" : 2
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2020,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10448/thumb_ca538c343179bf0fbdfab6cd10469afd.jpg",
                              "percentum" : 93,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "可折叠棉麻收纳袋",
                              "total" : 15,
                              "total_count" : 14
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2025,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10490/thumb_9371882dcce45ee625a0ce0ba5d0b81d.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "简约棉麻收纳袋",
                              "total" : 10,
                              "total_count" : 10
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2026,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10498/thumb_550319b866c18a57d557d61167728919.jpg",
                              "percentum" : 60,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "广口小玻璃插花瓶",
                              "total" : 5,
                              "total_count" : 3
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2030,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10553/thumb_7946ff6cd3f75bb0582314ff7eb96971.jpg",
                              "percentum" : 100,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "衣柜悬挂式收纳袋",
                              "total" : 9,
                              "total_count" : 9
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 2031,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10557/thumb_4a9ce85c122e8b6c633518f8012b4180.jpg",
                              "percentum" : 87,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "多功能木质收纳盒",
                              "total" : 8,
                              "total_count" : 7
                          },
                          {
                              "cost_price" : 20,
                              "designer" : "",
                              "id" : 1996,
                              "img" : "http://www.zhaidou.com/uploads/sale/merch_img/merch_img/10227/thumb_f3ccdd27d2000e3f9255a7e3e2c48800.jpg",
                              "percentum" : 83,
                              "price" : 0,
                              "sale_cate" : 1,
                              "title" : "怀旧马口铁收纳盒",
                              "total" : 6,
                              "total_count" : 5
                          }
                          ],
        "start_time" : "2015-10-22T00:00:00.000+08:00"
    }
}

#pragma mark - 天天刮奖
/*
    html 使用UIWebView
 */
http://www.zhaidou.com/lotteries

#pragma mark - 转发有喜
/*
    html 使用UIWebView
 */
http://www.zhaidou.com/retweet

#pragma mark - 特卖商城banner
/*
    status 1
    page 1
 */
http://www.zhaidou.com/special_mall/api/sales/sale_banner?status=1&page=1
{
    "sale_banners": [{
        "id": 27,
        "title": null,
        "r_type": 0,
        "r_value": "",
        "imgs": "http://www.zhaidou.com/uploads/sale/sale_banner/imgs/27/74b49bf3c5d72ac13b2baa04e730b796.jpg",
        "banner_type": "1"
    }]
}


#pragma mark - 特卖商城
/*
    sale_cate 0
    page  1
 */
http://www.zhaidou.com/special_mall/api/sales?sale_cate=0&page=1
{
    "meta" : {
        "count" : 26,
        "page" : 1,
        "size" : 10
    },
    "sales" : [
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/90/cb6b55c192e33dc66d53ce36711cfa1d.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-20T00:00:00.000+08:00",
                   "id" : 90,
                   "over_day" : 29,
                   "start_time" : "2015-10-21T00:00:00.000+08:00",
                   "tags" : "3折起",
                   "title" : "一人食，不孤独的食物美学！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/95/dcf7950c1ae28298e945b15192d49d93.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-19T00:00:00.000+08:00",
                   "id" : 95,
                   "over_day" : 28,
                   "start_time" : "2015-10-20T00:00:00.000+08:00",
                   "tags" : "3折起",
                   "title" : "康熙走了表哭卡乐比回来了！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/85/7420bf77504e352c5ea5e435f337c091.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-18T00:00:00.000+08:00",
                   "id" : 85,
                   "over_day" : 27,
                   "start_time" : "2015-10-19T00:00:00.000+08:00",
                   "tags" : "3折起",
                   "title" : "男神爱的进口爆款香薰！抢走不谢！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/81/4b1f379ec0b753a1709a4a7a3660b00d.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-17T00:00:00.000+08:00",
                   "id" : 81,
                   "over_day" : 26,
                   "start_time" : "2015-10-18T00:00:00.000+08:00",
                   "tags" : "2折起",
                   "title" : "我就要这么“墙饰\"!"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/79/ac753a657e8b8ac0f2fdd49de0aa0902.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-16T00:00:00.000+08:00",
                   "id" : 79,
                   "over_day" : 25,
                   "start_time" : "2015-10-17T00:00:00.000+08:00",
                   "tags" : "2折起",
                   "title" : "爱我请你抱抱我！宅豆最爱的抱枕回来了！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/87/49ab7603fb66d0a4a28bd4d37dfc01a7.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-15T00:00:00.000+08:00",
                   "id" : 87,
                   "over_day" : 24,
                   "start_time" : "2015-10-16T00:00:00.000+08:00",
                   "tags" : "2折起",
                   "title" : "吃不起青岛大虾，约闺蜜在家喝下午茶！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/83/7420bf77504e352c5ea5e435f337c091.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-13T00:00:00.000+08:00",
                   "id" : 83,
                   "over_day" : 22,
                   "start_time" : "2015-10-14T00:00:00.000+08:00",
                   "tags" : "2折起",
                   "title" : "萌你一脸“收纳君” ~最美桌面收纳补货！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/77/13f2e4ffb038eb89206627fadcf75098.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-10T00:00:00.000+08:00",
                   "id" : 77,
                   "over_day" : 19,
                   "start_time" : "2015-10-11T00:00:00.000+08:00",
                   "tags" : "3折起",
                   "title" : "浴室美妙收纳，洗香香，心飞扬！"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/75/dcf7950c1ae28298e945b15192d49d93.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-09T00:00:00.000+08:00",
                   "id" : 75,
                   "over_day" : 18,
                   "start_time" : "2015-10-10T00:00:00.000+08:00",
                   "tags" : "3折起",
                   "title" : "“壁咚”留香升级版，“女神“衣物护理有妙招"
               },
               {
                   "banner" : "http://www.zhaidou.com/uploads/sale/sale/banner/73/7420bf77504e352c5ea5e435f337c091.jpg",
                   "day" : 30,
                   "end_time" : "2015-11-08T00:00:00.000+08:00",
                   "id" : 73,
                   "over_day" : 17,
                   "start_time" : "2015-10-09T00:00:00.000+08:00",
                   "tags" : "2折起",
                   "title" : "一杯红酒配电影，小资酒架也疯狂"
               }
               ]
}

#pragma mark - category
/*
    page 1
 */
http://www.zhaidou.com/article/api/article_categories?page=1
{
    "article_categories": [{
        "id": 2,
        "name": "环球美食",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0001",
        "children": []
    }, {
        "id": 3,
        "name": "餐厨达人",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0002",
        "children": []
    }, {
        "id": 4,
        "name": "办公文具",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0003",
        "children": []
    }, {
        "id": 5,
        "name": "数码科技",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0004",
        "children": []
    }, {
        "id": 6,
        "name": "睡眠减压",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0005",
        "children": []
    }, {
        "id": 7,
        "name": "日用工具",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0006",
        "children": []
    }, {
        "id": 8,
        "name": "收纳整理",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0007",
        "children": []
    }, {
        "id": 9,
        "name": "卫浴清洁",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0008",
        "children": []
    }, {
        "id": 10,
        "name": "美容保健",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0009",
        "children": []
    }, {
        "id": 11,
        "name": "外出旅行",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0010",
        "children": []
    }, {
        "id": 12,
        "name": "玩具母婴",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0011",
        "children": []
    }, {
        "id": 13,
        "name": "居家服饰",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0012",
        "children": []
    }, {
        "id": 14,
        "name": "美丽家居",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0013",
        "children": []
    }, {
        "id": 20,
        "name": "宠物天地",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "code": "a0014",
        "children": []
    }]
}

#pragma mark - category子项
/*
    per_page 10
    catetory_id  category项 id
    page 1
 */
http://www.zhaidou.com/article/api/articles?per_page=10&catetory_id=3&page=1

#pragma mark - search
/*
    page 1
    需要 实现搜索历史模块
 */
http://www.zhaidou.com/article/api/articles/hot_search?page=1
[
 "沙发",
 "清洁",
 "办公",
 "凳",
 "柜",
 "工业风",
 "北欧",
 "摆设",
 "地毯",
 "厨房",
 "美食",
 "收纳",
 "宠物"
 ]

#pragma mark - searchURL
/*
    search 要搜索的关键字
 */
单品:
http://www.zhaidou.com/article/api/article_items/search?search=%E5%8A%9E%E5%85%AC
攻略:
http://www.zhaidou.com/article/api/articles/search?search=%E6%B2%99%E5%8F%91

单品详情为url;

攻略详情:
/*
    需要拼接 41为攻略id
 */
http://www.zhaidou.com/article/articles/41?open=app

#pragma mark - 单品
/*
    page 1
 */
http://www.zhaidou.com/article/api/item_categories?page=1
{
    "item_categories": [{
        "id": 1,
        "name": "功能",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "children": [{
            "id": 2,
            "parent_id": 1,
            "lft": 2,
            "rgt": 5,
            "name": "环球美食",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/2/ce4a192f165cfdcfd2f292be27445d23.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/2/thumb_ce4a192f165cfdcfd2f292be27445d23.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 3,
            "parent_id": 1,
            "lft": 6,
            "rgt": 9,
            "name": "餐厨达人",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/3/538aa8249bcc9124d180f5525542b195.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/3/thumb_538aa8249bcc9124d180f5525542b195.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 4,
            "parent_id": 1,
            "lft": 10,
            "rgt": 13,
            "name": "办公文具",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/4/e8d9e5505f8fe7e51d4e19e03fe0e6cb.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/4/thumb_e8d9e5505f8fe7e51d4e19e03fe0e6cb.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 5,
            "parent_id": 1,
            "lft": 14,
            "rgt": 17,
            "name": "数码科技",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/5/80816329664fdedba2ada3b6528bfe8d.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/5/thumb_80816329664fdedba2ada3b6528bfe8d.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 6,
            "parent_id": 1,
            "lft": 18,
            "rgt": 21,
            "name": "睡眠减压",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/6/a635fff2a19bf97dfacd56a95765d289.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/6/thumb_a635fff2a19bf97dfacd56a95765d289.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 7,
            "parent_id": 1,
            "lft": 22,
            "rgt": 25,
            "name": "日用工具",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/7/b72410d5d744f163165c7f0d6c72da6e.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/7/thumb_b72410d5d744f163165c7f0d6c72da6e.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 8,
            "parent_id": 1,
            "lft": 30,
            "rgt": 33,
            "name": "收纳整理",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/8/3cdcea4dd4f111d53638588e2b810430.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/8/thumb_3cdcea4dd4f111d53638588e2b810430.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 9,
            "parent_id": 1,
            "lft": 26,
            "rgt": 29,
            "name": "卫浴清洁",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/9/3681792c7cf9209ccbda82c53d01c6d4.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/9/thumb_3681792c7cf9209ccbda82c53d01c6d4.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 10,
            "parent_id": 1,
            "lft": 34,
            "rgt": 37,
            "name": "美容保健",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/10/2515c3b00e5edc7e217ef65c0506eb31.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/10/thumb_2515c3b00e5edc7e217ef65c0506eb31.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 11,
            "parent_id": 1,
            "lft": 38,
            "rgt": 41,
            "name": "外出旅行",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/11/784143ac331970b1021661fb9106957b.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/11/thumb_784143ac331970b1021661fb9106957b.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 12,
            "parent_id": 1,
            "lft": 42,
            "rgt": 45,
            "name": "玩具母婴",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/12/5ecdafdf227ba8dd55a8a68391af3ea3.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/12/thumb_5ecdafdf227ba8dd55a8a68391af3ea3.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 13,
            "parent_id": 1,
            "lft": 46,
            "rgt": 49,
            "name": "居家服饰",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/13/1cfd030557dd71d76f3862d086338bac.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/13/thumb_1cfd030557dd71d76f3862d086338bac.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 114,
            "parent_id": 1,
            "lft": 50,
            "rgt": 53,
            "name": "宠物天地",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/114/5b10bd6f8adaa9b616fa87c1f14e189c.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/114/thumb_5b10bd6f8adaa9b616fa87c1f14e189c.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }]
    }, {
        "id": 28,
        "name": "家饰",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "children": [{
            "id": 29,
            "parent_id": 28,
            "lft": 56,
            "rgt": 59,
            "name": "隔断",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/29/cfbc8aac802b7f977005f50afa726747.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/29/thumb_cfbc8aac802b7f977005f50afa726747.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 31,
            "parent_id": 28,
            "lft": 60,
            "rgt": 73,
            "name": "灯饰",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/31/293542f24dc201674fcb197d48b4f856.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/31/thumb_293542f24dc201674fcb197d48b4f856.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 38,
            "parent_id": 28,
            "lft": 74,
            "rgt": 81,
            "name": "窗帘",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/38/63f426dbb199c5f7483b9bdf01382ebe.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/38/thumb_63f426dbb199c5f7483b9bdf01382ebe.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 42,
            "parent_id": 28,
            "lft": 82,
            "rgt": 85,
            "name": "地毯",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/42/3f248d8a8799ef03808fe88948ecd98a.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/42/thumb_3f248d8a8799ef03808fe88948ecd98a.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 46,
            "parent_id": 28,
            "lft": 86,
            "rgt": 95,
            "name": "布艺",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/46/54ec0efd49cc689446619140dbab7807.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/46/thumb_54ec0efd49cc689446619140dbab7807.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 52,
            "parent_id": 28,
            "lft": 96,
            "rgt": 111,
            "name": "墙饰",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/52/0bb99a231a1d6861354863345f13daf8.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/52/thumb_0bb99a231a1d6861354863345f13daf8.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 65,
            "parent_id": 28,
            "lft": 112,
            "rgt": 123,
            "name": "花植",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/65/30dbbf03b53c385f2b5829d67dd66df0.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/65/thumb_30dbbf03b53c385f2b5829d67dd66df0.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 71,
            "parent_id": 28,
            "lft": 124,
            "rgt": 145,
            "name": "器具",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/71/6e097909e2bebcd1493d4320f935d369.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/71/thumb_6e097909e2bebcd1493d4320f935d369.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 85,
            "parent_id": 28,
            "lft": 146,
            "rgt": 153,
            "name": "摆设",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/85/1165514c31b450686e975bb51967bca3.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/85/thumb_1165514c31b450686e975bb51967bca3.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }]
    }, {
        "id": 44,
        "name": "风格",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "children": [{
            "id": 45,
            "parent_id": 44,
            "lft": 156,
            "rgt": 159,
            "name": "田园",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/45/8e31fde9d304938fb3f97ec7c646970b.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/45/thumb_8e31fde9d304938fb3f97ec7c646970b.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 49,
            "parent_id": 44,
            "lft": 160,
            "rgt": 163,
            "name": "新中式",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/49/a1e8c55968b7261d855d9aa7711896a3.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/49/thumb_a1e8c55968b7261d855d9aa7711896a3.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 54,
            "parent_id": 44,
            "lft": 164,
            "rgt": 167,
            "name": "北欧",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/54/2aa017cd5e48d63f8ed6f0d5e6bff2b0.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/54/thumb_2aa017cd5e48d63f8ed6f0d5e6bff2b0.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 58,
            "parent_id": 44,
            "lft": 168,
            "rgt": 171,
            "name": "欧式",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/58/d4a5c2b91f36e81f43922e454818d6da.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/58/thumb_d4a5c2b91f36e81f43922e454818d6da.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 64,
            "parent_id": 44,
            "lft": 172,
            "rgt": 175,
            "name": "美式",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/64/542241942818460e54ecd50fe0512d7e.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/64/thumb_542241942818460e54ecd50fe0512d7e.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 78,
            "parent_id": 44,
            "lft": 176,
            "rgt": 179,
            "name": "现代",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/78/2ad1b1cbd247e329145d513621505cc0.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/78/thumb_2ad1b1cbd247e329145d513621505cc0.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 84,
            "parent_id": 44,
            "lft": 180,
            "rgt": 183,
            "name": "地中海",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/84/e8ee1d52cc8d2b03798f4df594a36547.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/84/thumb_e8ee1d52cc8d2b03798f4df594a36547.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 90,
            "parent_id": 44,
            "lft": 184,
            "rgt": 187,
            "name": "工业风",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/90/98ffcaeb79ede6b442ef6deae3fc045c.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/90/thumb_98ffcaeb79ede6b442ef6deae3fc045c.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }]
    }, {
        "id": 92,
        "name": "大件家具",
        "avatar": {
            "avatar": {
                "url": null,
                "thumb": {
                    "url": null
                }
            }
        },
        "level": 0,
        "children": [{
            "id": 95,
            "parent_id": 92,
            "lft": 190,
            "rgt": 193,
            "name": "沙发",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/95/84e97c7d7481fc80aefee1be31db4ce8.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/95/thumb_84e97c7d7481fc80aefee1be31db4ce8.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 96,
            "parent_id": 92,
            "lft": 194,
            "rgt": 197,
            "name": "桌子",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/96/6aa7c2f4ec727dd53a616fd5da24703c.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/96/thumb_6aa7c2f4ec727dd53a616fd5da24703c.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 97,
            "parent_id": 92,
            "lft": 198,
            "rgt": 201,
            "name": "椅子",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/97/ccb2e56beb459dc1f56b8fdaa19b9fea.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/97/thumb_ccb2e56beb459dc1f56b8fdaa19b9fea.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 98,
            "parent_id": 92,
            "lft": 202,
            "rgt": 205,
            "name": "几类",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/98/f72568ee379eb7f1ef64bf513f3242ba.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/98/thumb_f72568ee379eb7f1ef64bf513f3242ba.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 99,
            "parent_id": 92,
            "lft": 206,
            "rgt": 209,
            "name": "柜类",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/99/5de21b5a2b0825d7ef6243b1f10389fe.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/99/thumb_5de21b5a2b0825d7ef6243b1f10389fe.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 100,
            "parent_id": 92,
            "lft": 210,
            "rgt": 213,
            "name": "床类",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/100/e7fffc1e4e4398e61484e99509ffa2ab.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/100/thumb_e7fffc1e4e4398e61484e99509ffa2ab.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }, {
            "id": 101,
            "parent_id": 92,
            "lft": 214,
            "rgt": 217,
            "name": "凳类",
            "avatar": {
                "url": "www.zhaidou.com/uploads/article/item_category/avatar/101/12f81643fd7386dedc3c36d655c3feef.png",
                "thumb": {
                    "url": "www.zhaidou.com/uploads/article/item_category/avatar/101/thumb_12f81643fd7386dedc3c36d655c3feef.png"
                }
            },
            "level": 1,
            "is_piblish": true
        }]
    }]
}

#pragma mark - 单品详情
/*
    item_catetory_id 为单品id值
    per_page 10
    page 1
*/
http://www.zhaidou.com/article/api/article_items?item_catetory_id=2&per_page=10&page=1

#pragma mark - 单品详情的详情
/*
    待定
 
 */
http://h5.m.taobao.com/awp/core/detail.htm?id=44122712293&ali_trackid=2:mm_107143289_8460050_28430913:1445518173_260_340196377&e=n7WXeCDTu0YcQipKwQzePOeEDrYVVa64Qih_7PxfOKS5VBFTL4hn2Xlx6VVEF2jqYXyJLYCFAeYUr0qdeNEbqMAS8doaCy7uff9Cu2BBXl3FLW3VyDCeoQlAg3jTgwuqoG6MG6pZea6z8h04GrbhPcXyFn1X9GbYTIuCoApQMmpnuKJUD_qMC8ntFNFwXRqe&type=2
"url" : "http://s.click.taobao.com/t?e=m%3D2%26s%3D1qiB0weaoiocQipKwQzePOeEDrYVVa64Qih%2F7PxfOKS5VBFTL4hn2Xlx6VVEF2jqYXyJLYCFAeYUr0qdeNEbqMAS8doaCy7uff9Cu2BBXl3FLW3VyDCeoQlAg3jTgwuqoG6MG6pZea6z8h04GrbhPXEqY%2Bakgpmw"
}

#pragma mark - 美丽家
//客厅方案
/*
    zdclient ios
    tag 006
    json 1
    count 10
 */
http://buy.zhaidou.com/?zdclient=ios&tag=006&json=1&count=10
http://buy.zhaidou.com/?zdclient=ios&tag=006&json=1&count=10&page=1
//客厅方案详细
/*
    html
    使用UIWebView
    p 客厅方案中 id值
    zdclient  ios
 */
http://buy.zhaidou.com/?p=19007&zdclient=ios

//整体方案
/*
    html
    使用UIWebView
 */
http://buy.zhaidou.com/gl.html
#endif
#endif
