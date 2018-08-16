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

- (void)insertDataToTable:(NSString *)table withModel:(HTStudentModel *)model;
- (void)deleteDataFromTable:(NSString *)table withModel:(HTStudentModel *)model;
- (void)updateDataInTable:(NSString *)table withModel:(HTStudentModel *)model;
- (void)queryDataFromTable:(NSString *)table withKeyword:(NSString *)keyword;
- (void)fetchAllDataInTable:(NSString *)table;

@end
