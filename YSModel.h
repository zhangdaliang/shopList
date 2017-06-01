//
//  YSModel.h
//  Template
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright (c) 2014年 sure. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"

@interface YSModel : NSObject<YYModel>

+ (instancetype)model;
+ (instancetype)modelWithDic:(NSDictionary *)dic;

- (instancetype)initWithDic:(NSDictionary *)dic;
- (void)setDataWithDic:(NSDictionary *)dic;

//通过数据创建
+ (NSMutableArray *)modelListFromArray:(NSArray *)arr;

//合并2个dic，可以传nil
+ (NSDictionary *)combineDic:(NSDictionary *)dic dic:(NSDictionary *)dic2;

@end
