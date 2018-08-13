//
//  HTInputView.m
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTInputView.h"

@implementation HTInputView
- (instancetype)init{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.titleLab = [[UILabel alloc]init];
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.mas_top).mas_offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-5);
        make.width.mas_equalTo(80);
    }];
    self.titleLab.font = [UIFont systemFontOfSize:16];
    self.titleLab.textColor = [UIColor redColor];
    
    self.inputFld = [[UITextField alloc]init];
    [self addSubview:self.inputFld];
    [self.inputFld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLab.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.mas_right).mas_offset(-10);
        make.top.bottom.mas_equalTo(self).mas_offset(0);
    }];
    self.inputFld.font = [UIFont systemFontOfSize:14];
    self.inputFld.textColor = [UIColor blackColor];
}
@end
