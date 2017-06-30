//
//  HDTableViewCell.m
//  MSUITableViewDemoObjC
//
//  Created by denglibing on 2017/2/14.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "HDTableViewCell.h"

@implementation HDTableViewCell

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass(self.class));
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.numberOfLines = 0;
        self.separateLineOffset = 10;
    }
    return self;
}

- (void)setCellData:(NSString *)MSCellData delegate:(id)delegate{
    self.MSCellData = MSCellData;
    self.MSDelegate = delegate;
    self.textLabel.text = MSCellData;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat height = [HDTableViewCell cellHeightWithCellData:self.MSCellData];
    self.textLabel.frame =  CGRectMake(10, 10, self.frame.size.width - 20, height - 20);
}

+ (CGFloat)cellHeightWithCellData:(NSString *)cellData{
    NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    CGRect rect = [cellData boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 999)
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:dic
                                         context:nil];
    return 20 + rect.size.height;
}

@end
