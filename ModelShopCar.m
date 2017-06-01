//
//  ModelShopCar.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "ModelShopCar.h"
@implementation ModelGoods
@end
@implementation ModelShopCar

+(NSDictionary *)modelCustomPropertyMapper
{
    return @{@"typeName":@"typename"};
}
+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"goodslist":[ModelGoods class]};
}
@end
