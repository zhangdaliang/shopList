//
//  goodsView.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "goodsView.h"
#import "shopHeader.h"
#import "ModelShopCar.h"
#import "goodsCell.h"
@interface goodsView ()<
UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic,strong) UITableView            *tableView;
@property (nonatomic,strong) NSMutableArray         *dataArray;
@end
@implementation goodsView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(100, 64, Screen_width-100, Screen_height-60-64)];
    if (self) {
        self.dataArray = [NSMutableArray array];
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds style:(UITableViewStylePlain)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc]init];
        self.tableView = tableView;
        [self addSubview:tableView];
    }
    return self;
}
-(void)setModel:(ModelShopCar *)model
{
    _model = model;
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:model.goodslist];
    [self.tableView setContentOffset:CGPointMake(0, 0)];
    [self.tableView reloadData];
}
-(void)blockData
{
    if (self.changeDataBlock) {
        self.changeDataBlock(self.model);
    }
}
#pragma mark-tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    goodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[goodsCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    ModelGoods *model = self.dataArray[indexPath.row];
    cell.model = model;
    __weak goodsView *weak_self = self;
    cell.clickBlock = ^(BOOL  isAdd){
        if(isAdd){
            if(model.buyNum==[model.ordernum integerValue]){
                return ;
            }
            model.buyNum += 1;
            weak_self.model.goodsNum +=1;
        }else{
            if (model.buyNum == 0) {
                return;
            }
            model.buyNum -= 1;
            weak_self.model.goodsNum -=1;
        }
        [weak_self.dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        [weak_self blockData];
        [weak_self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    };
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self blockData];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:YES];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
