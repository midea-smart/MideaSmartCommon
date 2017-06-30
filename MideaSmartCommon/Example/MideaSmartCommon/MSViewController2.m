//
//  MSViewController2.m
//  MideaSmartCommon
//
//  Created by 邓立兵 on 2017/6/30.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "MSViewController.h"
#import "MSViewController2.h"

#import <MideaSmartCommon/MSTableViewHeader.h>

#import "HDTableViewCell.h"

@interface MSViewController2 ()
    
@property (nonatomic, strong) MSTableViewConverter *tableViewConverter;
    
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation MSViewController2

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass(self.class));
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ViewController2";
    
    NSArray *randomSources = @[@"Swift is now open source!",
                               @"We are excited by this new chapter in the story of Swift. After Apple unveiled the Swift programming language, it quickly became one of the fastest growing languages in history. Swift makes it easy to write software that is incredibly fast and safe by design. Now that Swift is open source, you can help make the best general purpose programming language available everywhere",
                               @"For students, learning Swift has been a great introduction to modern programming concepts and best practices. And because it is now open, their Swift skills will be able to be applied to an even broader range of platforms, from mobile devices to the desktop to the cloud.",
                               @"Welcome to the Swift community. Together we are working to build a better programming language for everyone.",
                               @"– The Swift Team"];
    self.dataArr = [@[] mutableCopy];
    for (int i=0; i<30; i++) {
        NSInteger randomIndex = arc4random() % 5;
        MSBaseCellModel *cellModel = [MSBaseCellModel modelFromCellClass:HDTableViewCell.class cellHeight:[HDTableViewCell cellHeightWithCellData:randomSources[randomIndex]] cellData:randomSources[randomIndex]];
        [self.dataArr addObject:cellModel];
    }
    
    [self disposeTableViewConverter];
}
    
- (void)disposeTableViewConverter{
    _tableViewConverter = [[MSTableViewConverter alloc] initWithTableViewCarrier:self daraSources:self.dataArr];
    _tableViewConverter.converterType = MSTableViewConverter_Response;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = _tableViewConverter;
    tableView.dataSource = _tableViewConverter;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[MSViewController new] animated:YES];
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MSBaseCellModel *cellModel = self.dataArr[indexPath.row];
    MSBaseTableViewCell *cell = [tableView cellForIndexPath:indexPath cellClass:cellModel.cellClass];
    [cell setCellData:cellModel.cellData delegate:self];
    [cell setSeperatorLine:indexPath numberOfRowsInSection:self.dataArr.count];
    return cell;
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
