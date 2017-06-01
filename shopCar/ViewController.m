//
//  ViewController.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "ViewController.h"
#import "leftView.h"
#import "goodsView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    leftView *lv = [[leftView alloc]init];
    lv.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:lv];
    
    goodsView *gv = [[goodsView alloc]init];
    gv.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    gv.model = lv.goodsModel;
    [self.view addSubview:gv];
    
    __weak goodsView *weakGv = gv;
    __weak leftView *weakLv = lv;
    lv.clickBlock = ^(ModelShopCar *model){
        weakGv.model = model;
    };
    gv.changeDataBlock = ^(ModelShopCar *model){
        weakLv.goodsModel = model;
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
