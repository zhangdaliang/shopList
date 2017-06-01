//
//  goodsView.h
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModelShopCar;
@interface goodsView : UIView

@property (nonatomic,strong)ModelShopCar *model;

@property (nonatomic,copy) void(^changeDataBlock)(ModelShopCar *);

@end
