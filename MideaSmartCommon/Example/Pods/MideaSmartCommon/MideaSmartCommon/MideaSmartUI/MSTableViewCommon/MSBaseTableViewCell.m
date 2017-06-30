//
//  MSBaseTableViewCell.m
//  MSUITableViewDemoObjC
//
//  Created by denglibing on 2017/2/14.
//  Copyright © 2017年 denglibing. All rights reserved.
//

#import "MSBaseTableViewCell.h"

@implementation MSBaseTableViewCell{
    CGFloat sizeOnePx;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeightWithCellData:(id)cellData{
    return [self cellHeightWithCellData:cellData boundWidth:[UIScreen mainScreen].bounds.size.width];
}

+ (CGFloat)cellHeightWithCellData:(id)cellData boundWidth:(CGFloat)width{
    return 44.0f;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self internalInit];
        
        self.cellType = MSBaseTableViewCellNone;
        _separateLineOffset = 0;
        sizeOnePx = 1.0 / [UIScreen mainScreen].scale;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self internalInit];
    }
    return self;
}

-(void)internalInit{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _lineColor = [UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1.0];
    
    _topLineView = [[UIView alloc] init];
    _topLineView.backgroundColor = _lineColor;
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = _lineColor;
    
    [self.contentView addSubview:_topLineView];
    [self.contentView addSubview:_bottomLineView];
    
    //初始化的时候隐藏线
    _topLineView.hidden = YES;
    _bottomLineView.hidden = YES;
}


-(void)setCellType:(MSBaseTableViewCellType)type{
    _cellType = type;
    
    switch (_cellType) {
            
        case MSBaseTableViewCellNone:
            _topLineView.hidden = YES;
            _bottomLineView.hidden = YES;
            break;
            
        case MSBaseTableViewCellAtFirst:
        case MSBaseTableViewCellNormal:
        case MSBaseTableViewCellAtMiddle:
            _topLineView.hidden = NO;
            _bottomLineView.hidden = YES;
            break;
            
        case MSBaseTableViewCellAtLast:
        case MSBaseTableViewCellSingle:
            _topLineView.hidden = NO;
            _bottomLineView.hidden = NO;
            break;
            
        default:
            break;
    }
    
    [self setNeedsLayout];
}

- (void)setLineColor:(UIColor *)lineColor{
    _lineColor = lineColor;
    _topLineView.backgroundColor = _lineColor;
    _bottomLineView.backgroundColor = _lineColor;
}

- (void)setCellData:(id)MSCellData{
    [self setCellData:MSCellData delegate:nil];
}

- (void)setCellData:(id)MSCellData delegate:(id)delegate{
    _MSCellData = MSCellData;
    _MSDelegate = delegate;
}

- (void)setSeperatorLine:(NSIndexPath *)indexPath numberOfRowsInSection:(NSInteger)numberOfRowsInSection{
    if (numberOfRowsInSection == 1) {
        self.cellType = MSBaseTableViewCellSingle;
    }
    else {
        if (indexPath.row == 0) {
            self.cellType = MSBaseTableViewCellAtFirst;
        }
        else if (indexPath.row == numberOfRowsInSection - 1) {
            self.cellType = MSBaseTableViewCellAtLast;
        }
        else {
            self.cellType = MSBaseTableViewCellAtMiddle;
        }
    }
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    switch (_cellType) {
        case MSBaseTableViewCellNone:
            _topLineView.frame = CGRectMake(_separateLineOffset, 0.0, self.frame.size.width - _separateLineOffset, sizeOnePx);
            _bottomLineView.frame = CGRectMake(_separateLineOffset, self.bounds.size.height - sizeOnePx, self.frame.size.width - _separateLineOffset, sizeOnePx);
            break;
            
        case MSBaseTableViewCellAtFirst:
            _topLineView.frame = CGRectMake(0.0, 0.0, self.frame.size.width, sizeOnePx);
            _bottomLineView.frame = CGRectMake(_separateLineOffset, self.bounds.size.height - sizeOnePx, self.frame.size.width - _separateLineOffset, sizeOnePx);
            break;
            
        case MSBaseTableViewCellAtMiddle:
        case MSBaseTableViewCellNormal:
            _topLineView.frame = CGRectMake(_separateLineOffset, 0.0, self.frame.size.width - _separateLineOffset, sizeOnePx);
            _bottomLineView.frame = CGRectMake(_separateLineOffset, self.bounds.size.height - sizeOnePx, self.frame.size.width - _separateLineOffset, sizeOnePx);
            break;
        
        case MSBaseTableViewCellAtLast:
            _topLineView.frame = CGRectMake(_separateLineOffset, 0.0, self.frame.size.width - _separateLineOffset, sizeOnePx);
            _bottomLineView.frame = CGRectMake(0.0, self.bounds.size.height - sizeOnePx, self.frame.size.width, sizeOnePx);
            break;
            
        case MSBaseTableViewCellSingle:
            _topLineView.frame = CGRectMake(0.0, 0.0, self.frame.size.width, sizeOnePx);
            _bottomLineView.frame = CGRectMake(0.0, self.bounds.size.height - sizeOnePx, self.frame.size.width, sizeOnePx);
            break;
            
        default:
            break;
    }
}

@end
