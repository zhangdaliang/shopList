//
//  goodsCell.h
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "BaseCell.h"

@interface goodsCell : BaseCell

@property (nonatomic,copy) void(^clickBlock)(BOOL);

@end
