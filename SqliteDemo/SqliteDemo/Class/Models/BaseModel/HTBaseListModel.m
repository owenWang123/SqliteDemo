//
//  HTBaseListModel.m
//  SkeletonDemo
//
//  Created by 王浩田 on 2017/8/22.
//  Copyright © 2017年 王浩田. All rights reserved.
//

#import "HTBaseListModel.h"

@implementation HTBaseListModel
+(NSValueTransformer *)dataJSONTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[self elementModelClass]];
}

+(Class)elementModelClass
{
    return [MTLModel class];
}

@end
