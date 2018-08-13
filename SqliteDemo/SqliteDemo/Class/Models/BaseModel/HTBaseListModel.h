//
//  HTBaseListModel.h
//  SkeletonDemo
//
//  Created by 王浩田 on 2017/8/22.
//  Copyright © 2017年 王浩田. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTBaseListModel : HTBaseModel
@property (nonatomic, strong) NSArray *data;

// 需要子类实现
+(Class)elementModelClass;

@end
