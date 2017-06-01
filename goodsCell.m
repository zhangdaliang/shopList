//
//  goodsCell.m
//  shopCar
//
//  Created by zhangdaliang on 17/5/31.
//  Copyright © 2017年 yshow. All rights reserved.
//

#import "goodsCell.h"
#import "ModelShopCar.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
@interface goodsCell()
@property (nonatomic,strong) UIImageView    *goodsImg;
@property (nonatomic,strong) UILabel        *nameLb;
@property (nonatomic,strong) UILabel        *numLb;
@property (nonatomic,strong) UILabel        *priceLb;
@property (nonatomic,strong) UILabel        *addNumLb;
@end
@implementation goodsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *goodsImg = [[UIImageView alloc]init];
        goodsImg.contentMode = UIViewContentModeScaleAspectFit;
        self.goodsImg = goodsImg;
        [self.contentView addSubview:goodsImg];
        [goodsImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(80);
            make.width.mas_equalTo(80);
        }];
        UILabel *nameLb = [[UILabel alloc]init];
        nameLb.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:nameLb];
        self.nameLb = nameLb;
        [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(goodsImg.mas_right).offset(10);
        }];
        UILabel *numLb = [[UILabel alloc]init];
        numLb.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:numLb];
        self.numLb = numLb;
        [numLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(nameLb.mas_bottom).offset(5);
            make.left.mas_equalTo(goodsImg.mas_right).offset(10);
        }];
        UILabel *priceLb = [[UILabel alloc]init];
        priceLb.font = [UIFont systemFontOfSize:12];
        priceLb.textColor = [UIColor redColor];
        [self.contentView addSubview:priceLb];
        self.priceLb = priceLb;
        [priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(numLb.mas_bottom).offset(5);
            make.left.mas_equalTo(goodsImg.mas_right).offset(10);
        }];
        UIButton *addBtn = [[UIButton alloc]init];
        [addBtn setImage:[UIImage imageNamed:@"add"] forState:(UIControlStateNormal)];
        addBtn.tag = 1;
        [addBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-10);
            make.height.width.mas_equalTo(44);
        }];
        UILabel *addNumLb = [[UILabel alloc]init];
        addNumLb.font = [UIFont systemFontOfSize:14];
        self.addNumLb = addNumLb;
        [self.contentView addSubview:addNumLb];
        [addNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(addBtn);
            make.right.mas_equalTo(addBtn.mas_left);
        }];
        UIButton *rmBtn = [[UIButton alloc]init];
        [rmBtn setImage:[UIImage imageNamed:@"remove"] forState:(UIControlStateNormal)];
        rmBtn.tag = 2;
        [rmBtn addTarget:self action:@selector(clickAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:rmBtn];
        [rmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(addNumLb.mas_left);
            make.height.width.mas_equalTo(44);
        }];
        
    }
    return self;
}
-(void)setModel:(ModelGoods *)model
{
    [self.goodsImg cancelCurrentImageLoad];
    [self.goodsImg setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://in.ganinfo.com/files/img/%@",model.images]]];
    self.nameLb.text = model.name;
    self.numLb.text = [NSString stringWithFormat:@"库存：%@",model.ordernum];
    self.priceLb.text = [NSString stringWithFormat:@"￥%.1f/%@",model.price,model.spec];
    self.addNumLb.text = [@(model.buyNum) stringValue];
    
}
-(void)clickAction:(UIButton *)btn
{
    if (self.clickBlock) {
        self.clickBlock(btn.tag==1);
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
