//
//  CGXCollectionViewBaseCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseCell.h"

@interface CGXCollectionCategoryBaseCell()

@property (nonatomic, strong,readwrite) CGXCollectionCategoryBaseItemModel *cellModel;
@property (nonatomic, strong,readwrite) NSIndexPath *cellIndexPath;


@end

@implementation CGXCollectionCategoryBaseCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        [self initializeViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
         [self initializeViews];
    }
    return self;
}
- (void)initializeViews
{
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    [CATransaction commit];
    
}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{
    self.cellModel = cellModel;
    self.cellIndexPath = indexPath;
    self.contentView.backgroundColor = cellModel.cellColor;
}
@end
