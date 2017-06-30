//
//  MSBaseCellModel.m
//  MSUITableViewDemoObjC
//
//  Created by denglibing on 2017/2/14.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "MSBaseCellModel.h"

@implementation MSBaseCellModel

+ (instancetype)modelFromCellClass:(Class)cellClass cellHeight:(CGFloat)cellHeight cellData:(id)cellData{
    MSBaseCellModel *cellModel = [[self alloc] init];
    cellModel.cellClass = cellClass;
    cellModel.cellHeight = cellHeight;
    cellModel.cellData = cellData;
    return cellModel;
}

- (instancetype)initWithCellClass:(Class)cellClass cellHeight:(CGFloat)cellHeight cellData:(id)cellData{
    return [MSBaseCellModel modelFromCellClass:cellClass cellHeight:cellHeight cellData:cellData];
}

@end
