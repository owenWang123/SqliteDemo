//
//  HTInputView.h
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTInputView : UIView<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UITextField *inputFld;

@end
