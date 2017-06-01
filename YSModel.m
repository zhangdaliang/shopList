//
//  YSModel.m
//  Template
//
//  Created by 谷硕 on 14/11/5.
//  Copyright (c) 2014年 sure. All rights reserved.
//

#import "YSModel.h"

@implementation YSModel

+ (instancetype) model {
    return [[self alloc] init];
}
+ (instancetype) modelWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

- (instancetype) initWithDic:(NSDictionary *)dic {

    if (![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    if (self = [super init]) {
        [self setDataWithDic:dic];
    }
    return self;
}

- (void) setDataWithDic:(NSDictionary *)dic {
    [self modelSetWithDictionary:dic];
}

+ (NSMutableArray *)modelListFromArray:(NSArray *)arr
{
    if (![arr isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray *list = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [list addObject:[self modelWithDic:obj]];
    }];
    if (list.count) {
        return list;
    }
    return nil;
}

+ (NSDictionary *)combineDic:(NSDictionary *)dic dic:(NSDictionary *)dic2
{
    if (dic && ![dic isKindOfClass:[NSDictionary class]]) {
        NSLog(@"combineDic params must be NSDictionary");
        dic = nil;
    }
    if (dic2 && ![dic2 isKindOfClass:[NSDictionary class]]) {
        NSLog(@"combineDic params must be NSDictionary");
        dic2 = nil;
    }
    if (dic && dic2) {
        NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithDictionary:dic];
        [mDic addEntriesFromDictionary:dic2];
        return mDic;
    }
    NSDictionary *result = nil;
    if (dic) {
        result = dic;
    }
    if (dic2) {
        result = dic2;
    }
    return result;
}

@end
