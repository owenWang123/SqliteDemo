//
//  HTScoreManager.h
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTStudentModel.h"

@interface HTScoreManager : NSObject
+ (HTScoreManager *)sharedManager;

- (BOOL)insertDataToTable:(NSString *)table withModel:(HTStudentModel *)model;
- (BOOL)deleteDataFromTable:(NSString *)table withModel:(HTStudentModel *)model;
- (BOOL)updateDataInTable:(NSString *)table withModel:(HTStudentModel *)model;
- (NSArray *)queryDataFromTable:(NSString *)table withKeyword:(NSString *)keyword;
- (NSArray *)fetchAllDataInTable:(NSString *)table;

@end
