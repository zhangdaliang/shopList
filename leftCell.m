//
//  leftCell.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "leftCell.h"
#import "ModelShopCar.h"

@interface leftCell ()
@property (nonatomic,strong) UILabel *numLb;

@end

@implementation leftCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *nameLb = [[UILabel alloc]init];
        nameLb.font = [UIFont systemFontOfSize:14];
        self.nameLb = nameLb;
        [self.contentView addSubview:nameLb];
        [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.contentView);
        }];
        
        UILabel *numLb = [[UILabel alloc]init];
        numLb.font = [UIFont systemFontOfSize:11];
        numLb.textColor = [UIColor redColor];
        self.numLb = numLb;
        [self.contentView addSubview:numLb];
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.right.mas_equalTo(-5);
        }];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(0.5);
            make.bottom.mas_equalTo(0);
        }];
        
    }
    return self;
}
-(void)setModel:(ModelShopCar *)model
{
    self.nameLb.text = model.typeName;
    if (model.goodsNum>0) {
        self.numLb.text = [@(model.goodsNum) stringValue];
    }else{
        self.numLb.text = @"";
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
