//
//  HTQueryViewController.m
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTQueryViewController.h"

@interface HTQueryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation HTQueryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    [self fetchData];
}
- (void)configUI{
    self.title = @"Query";
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
}
#pragma mark- delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ListCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.sourceArr.count >0) {
        HTStudentModel *studentModel = self.sourceArr[indexPath.row];
        cell.textLabel.text = studentModel.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"语文：%ld;数学：%ld;英语：%ld;",(long)studentModel.yuwen,(long)studentModel.math,(long)studentModel.english];
    }
    
    return cell;
}
#pragma mark- Method
- (void)fetchData{
    NSArray *dataArr = [[HTScoreManager sharedManager] fetchAllDataInTable:@"t_class1"];
    
    [self.sourceArr removeAllObjects];
    [self.sourceArr addObjectsFromArray:dataArr];
    
    [self.tableView reloadData];
}
#pragma mark- lazy
- (NSMutableArray *)sourceArr{
    if (_sourceArr == nil) {
        _sourceArr = [NSMutableArray array];
    }
    return _sourceArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
