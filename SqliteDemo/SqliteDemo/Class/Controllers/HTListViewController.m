//
//  HTListViewController.m
//  SqliteDemo
//
//  Created by admin on 2018/8/13.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "HTListViewController.h"
#import "HTDeleteViewController.h"
#import "HTUpdateViewController.h"

@interface HTListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sourceArr;

@end

@implementation HTListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}
- (void)configUI{
    self.title = @"List";
    
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.sourceArr.count >0) {
        cell.textLabel.text = self.sourceArr[indexPath.row];
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self jumpToOtherPageWithSelectedIndex:indexPath.row];
}
#pragma mark- Method
- (void)fetchData{
    
}
- (void)jumpToOtherPageWithSelectedIndex:(NSInteger)selectedIndex{
    if (self.sourceType == 1){
        HTDeleteViewController *controller = [[HTDeleteViewController alloc]init];
        controller.selectedIndex = selectedIndex;
        [self.navigationController pushViewController:controller animated:YES];
    }else if (self.sourceType == 2){
        HTUpdateViewController *controller = [[HTUpdateViewController alloc]init];
        controller.selectedIndex = selectedIndex;
        [self.navigationController pushViewController:controller animated:YES];
    }else if (self.sourceType == 3){
        
    }
}
#pragma mark- lazy
- (NSMutableArray *)sourceArr{
    if (_sourceArr == nil) {
        NSArray *tmpArr = @[@"1",@"2",@"3",@"4"];
        _sourceArr = [NSMutableArray arrayWithArray:tmpArr];
    }
    return _sourceArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
