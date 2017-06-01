//
//  leftView.h
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "shopHeader.h"
#import "ModelShopCar.h"


@interface leftView : UIView

@property (nonatomic,strong) ModelShopCar *goodsModel;

@property (nonatomic,copy) void(^clickBlock)(ModelShopCar *);

@end
