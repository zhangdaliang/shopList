//
//  leftView.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "leftView.h"
#import "leftCell.h"

@interface leftView ()<UITableViewDelegate,
UITableViewDataSource>

@property (nonatomic,strong) UITableView            *tableView;
@property (nonatomic,strong) NSMutableArray         *dataArray;
@property (nonatomic,assign) NSInteger              selectIndex;

@end

@implementation leftView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, 0,100, Screen_height)];
    if (self) {
        NSString *jsonStr = [[NSBundle mainBundle] pathForResource:@"dataJson" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:jsonStr];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *arr = [ModelShopCar modelListFromArray:dict[@"data"]];
        self.dataArray = [NSMutableArray arrayWithArray:arr];
        _goodsModel = self.dataArray.firstObject;
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.bounds style:(UITableViewStylePlain)];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = [[UIView alloc]init];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.tableView = tableView;
        [self addSubview:tableView];
        
    }
    return self;
}
-(void)setGoodsModel:(ModelShopCar *)goodsModel
{
    ModelShopCar *model = self.dataArray[self.selectIndex];
    [self.dataArray replaceObjectAtIndex:self.selectIndex withObject:model];
    [self.tableView reloadData];
}
-(void)blockData
{
    if (self.clickBlock) {
        self.clickBlock(self.dataArray[self.selectIndex]);
    }
}
#pragma mark-tableView delegate dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    leftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[leftCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.model = self.dataArray[indexPath.row];
    if (indexPath.row == self.selectIndex) {
        cell.nameLb.textColor = [UIColor redColor];
    }else{
        cell.nameLb.textColor = [UIColor grayColor];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectIndex != indexPath.row) {
        self.selectIndex = indexPath.row;
        [self.tableView reloadData];
        [self blockData];
    }
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
