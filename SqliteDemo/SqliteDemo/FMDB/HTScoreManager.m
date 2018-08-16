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
- (void)insertDataToTable:(NSString *)table withModel:(HTStudentModel *)model{
    
}
- (void)deleteDataFromTable:(NSString *)table withModel:(HTStudentModel *)model{
    
}
- (void)updateDataInTable:(NSString *)table withModel:(HTStudentModel *)model{
    
}
- (void)queryDataFromTable:(NSString *)table withKeyword:(NSString *)keyword{
    
}
- (void)fetchAllDataInTable:(NSString *)table{
    
}
@end
