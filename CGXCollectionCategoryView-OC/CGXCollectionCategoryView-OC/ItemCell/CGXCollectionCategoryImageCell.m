//
//  CGXCollectionCategoryImageCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryImageCell.h"

@implementation CGXCollectionCategoryImageCell

- (void)initializeViews
{
    [super initializeViews];
    
    self.covImageView = [UIImageView new];
    self.covImageView.clipsToBounds = YES;
    self.covImageView.layer.masksToBounds = YES;
    self.covImageView.layer.borderWidth = 1;
    self.covImageView.layer.borderColor = [UIColor colorWithWhite:0.93 alpha:1].CGColor;
    self.covImageView.layer.cornerRadius = 4;
    self.covImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.covImageView];
    
    self.covImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self updateCovImageView];
}
- (void)updateCovImageView
{
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.covImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.covImageView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.covImageView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.covImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.contentView addConstraint:top];
    [self.contentView addConstraint:left];
    [self.contentView addConstraint:right];
    [self.contentView addConstraint:bottom];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateCovImageView];
}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{
    self.covImageView.backgroundColor = cellModel.cellColor;
    if ([cellModel.dataModel isKindOfClass:[NSString class]]) {
       
    }
}
@end
