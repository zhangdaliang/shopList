//
//  ModelShopCar.h
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "YSModel.h"

@interface ModelGoods : YSModel
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *stype;
@property (nonatomic,copy) NSString *shopcode;
@property (nonatomic,copy) NSString *spec;
@property (nonatomic,copy) NSString *ordernum;
@property (nonatomic,assign) float  price;
@property (nonatomic,copy) NSString *oprice;
@property (nonatomic,copy) NSString *vantage;
@property (nonatomic,copy) NSString *stock;
@property (nonatomic,copy) NSString *titleimg;
@property (nonatomic,copy) NSString *images;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *authentication;
@property (nonatomic,copy) NSString *pno;
@property (nonatomic,copy) NSString *avgscore;
@property (nonatomic,copy) NSString *createtime;
@property (nonatomic,copy) NSString *modifytime;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *remark;
@property (nonatomic,assign) NSInteger id;
@property (nonatomic,assign) NSInteger buyNum;

@end

@interface ModelShopCar : YSModel
@property (nonatomic,copy) NSString *typecode;
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSString *precode;
@property (nonatomic,copy) NSString *ordernum;
@property (nonatomic,assign) NSInteger goodsNum;
@property (nonatomic,strong) NSArray<ModelGoods *>* goodslist;
@end
