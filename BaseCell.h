//
//  BaseCell.h
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "shopHeader.h"
#import "YSModel.h"

@interface BaseCell : UITableViewCell

@property (nonatomic,strong) YSModel *model;

@end
