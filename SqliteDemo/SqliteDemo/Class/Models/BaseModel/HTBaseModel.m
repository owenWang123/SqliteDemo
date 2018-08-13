//
//  HTBaseModel.m
//  SkeletonDemo
//
//  Created by 王浩田 on 2017/8/22.
//  Copyright © 2017年 王浩田. All rights reserved.
//

#import "HTBaseModel.h"

@implementation HTBaseModel
// aspect 不支持静态类方法
+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    
    // 将id转换为ID, id为obj-c关键词
    if ([[mapping allKeys] containsObject:@"ID"]) {
        mapping[@"ID"] = @"id";
    }
    
    if ([[mapping allKeys] containsObject:@"Description"]) {
        mapping[@"Description"] = @"description";
    }
    
    return mapping;
}

- (void)setNilValueForKey:(NSString *)key {
    [self setValue:@0 forKey:key];
}

@end
