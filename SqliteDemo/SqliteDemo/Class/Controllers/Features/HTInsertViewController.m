//
//  HTInsertViewController.m
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTInsertViewController.h"
#import "HTInputView.h"

@interface HTInsertViewController ()
@property (nonatomic, strong) HTInputView *nameView;
@property (nonatomic, strong) HTInputView *yuwenView;
@property (nonatomic, strong) HTInputView *mathView;
@property (nonatomic, strong) HTInputView *englishView;

@property (nonatomic, strong) UIButton *insertBtn;

@end

@implementation HTInsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}
- (void)configUI{
    self.title = @"Insert";
    
    self.nameView = [[HTInputView alloc]init];
    [self.view addSubview:self.nameView];
    [self.nameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).mas_offset(64);
        make.left.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    self.nameView.titleLab.text = @"姓名";
    self.nameView.inputFld.placeholder = @"name";
    self.nameView.inputFld.keyboardType = UIKeyboardTypeDefault;
    
    self.yuwenView = [[HTInputView alloc]init];
    [self.view addSubview:self.yuwenView];
    [self.yuwenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    self.yuwenView.titleLab.text = @"语文";
    self.yuwenView.inputFld.placeholder = @"yuwen score";
    self.yuwenView.inputFld.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    self.mathView = [[HTInputView alloc]init];
    [self.view addSubview:self.mathView];
    [self.mathView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.yuwenView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    self.mathView.titleLab.text = @"数学";
    self.mathView.inputFld.placeholder = @"math score";
    self.mathView.inputFld.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    self.englishView = [[HTInputView alloc]init];
    [self.view addSubview:self.englishView];
    [self.englishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mathView.mas_bottom).mas_offset(0);
        make.left.right.mas_equalTo(self.view).mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    self.englishView.titleLab.text = @"英语";
    self.englishView.inputFld.placeholder = @"english score";
    self.englishView.inputFld.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    self.insertBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.insertBtn];
    [self.insertBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.englishView.mas_bottom).mas_offset(40);
        make.centerX.mas_equalTo(self.view.mas_centerX).mas_offset(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(100);
    }];
    self.insertBtn.backgroundColor = [UIColor redColor];
    [self.insertBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.insertBtn setTitle:@"Insert" forState:UIControlStateNormal];
    [self.insertBtn addTarget:self action:@selector(insertAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)insertAction{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    
}
#pragma mark-
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
