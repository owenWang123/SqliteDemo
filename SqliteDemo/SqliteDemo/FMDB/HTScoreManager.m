//
//  HTScoreManager.m
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTScoreManager.h"

@interface HTScoreManager ()
@property (nonatomic,strong) FMDatabase *database;

@end
@implementation HTScoreManager
+ (HTScoreManager *)sharedManager{
    static HTScoreManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HTScoreManager alloc]init];
    });
    return manager;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self createDB];
    }
    return self;
}

- (void)createDB{
    //1.获得数据库文件的路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *database_path = [path stringByAppendingPathComponent:@"score.sqlite"];
    //2.获得数据库
    self.database = [FMDatabase databaseWithPath:database_path];
    
    // 创建表
    [self createTable1];
}
- (void)createTable1{
    //3.打开数据库
    BOOL isOpen = [self.database open];
    if (isOpen) {
        //4.创表
        BOOL result = [self.database executeUpdate:@"CREATE TABLE IF NOT EXISTS t_class1 (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, yuwen integer NOT NULL, math integer NOT NULL, english integer NOT NULL);"];
        if (result) {
            NSLog(@"创表成功");
        }else {
            NSLog(@"创表失败");
        }
    }
}
- (BOOL)insertDataToTable:(NSString *)table withModel:(HTStudentModel *)model{
    NSString *sqlStr = [NSString stringWithFormat:@"INSERT INTO %@ (name, yuwen, math, english) VALUES (?, ?, ?, ?);",table];
    
    BOOL success = [self.database executeUpdate:sqlStr, model.name, @(model.yuwen), @(model.math), @(model.english)];
    
    if (success) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败");
    }
    return success;
}
- (BOOL)deleteDataFromTable:(NSString *)table withModel:(HTStudentModel *)model{
    NSString *sqlStr = [NSString stringWithFormat:@"DELETE FROM %@ WHERE name = ?;",table];
    
    BOOL success = [self.database executeUpdate:sqlStr, model.name];
    
    if (success) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
    return success;
}
- (BOOL)updateDataInTable:(NSString *)table withModel:(HTStudentModel *)model{
    NSString *sqlStr = [NSString stringWithFormat:@"UPDATE %@ SET math = ? WHERE name = ?;",table];
    
    BOOL success = [self.database executeUpdate:sqlStr, @(model.math), model.name];
    
    if (success) {
        NSLog(@"更新成功");
    } else {
        NSLog(@"更新失败");
    }
    return success;
}
- (NSArray *)queryDataFromTable:(NSString *)table withKeyword:(NSString *)keyword{
    NSString *sqlStr = [NSString stringWithFormat:@"SELECT name, yuwen, math, english FROM %@ WHERE name = ?",table];
    
    FMResultSet *result = [self.database executeQuery:sqlStr, keyword];
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:10];
    while ([result next]) {
        HTStudentModel *studentModel = [[HTStudentModel alloc]init];
        
        studentModel.name = [result stringForColumn:@"name"];
        studentModel.yuwen = [result intForColumn:@"yuwen"];
        studentModel.math = [result intForColumn:@"math"];
        studentModel.english = [result intForColumn:@"english"];
        
        [resultArr addObject:studentModel];
    }
    
    return resultArr;
}
- (NSArray *)fetchAllDataInTable:(NSString *)table{
    NSString *sqlStr = [NSString stringWithFormat:@"SELECT * FROM %@",table];
    
    FMResultSet *result = [self.database executeQuery:sqlStr];
    
    NSMutableArray *resultArr = [NSMutableArray arrayWithCapacity:10];
    while ([result next]) {
        HTStudentModel *studentModel = [[HTStudentModel alloc]init];
        
        studentModel.name = [result stringForColumn:@"name"];
        studentModel.yuwen = [result intForColumn:@"yuwen"];
        studentModel.math = [result intForColumn:@"math"];
        studentModel.english = [result intForColumn:@"english"];
        
        [resultArr addObject:studentModel];
    }
    
    return resultArr;
}
@end
