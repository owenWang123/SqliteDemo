//
//  HTStudentModel.h
//  SqliteDemo
//
//  Created by admin on 2018/8/14.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTBaseModel.h"

@interface HTStudentModel : HTBaseModel
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger yuwen;
@property (nonatomic,assign) NSInteger math;
@property (nonatomic,assign) NSInteger english;

@end
