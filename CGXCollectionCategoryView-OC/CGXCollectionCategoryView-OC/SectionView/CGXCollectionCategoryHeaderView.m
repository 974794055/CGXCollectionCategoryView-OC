//
//  CGXCollectionCategoryHeaderView.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryHeaderView.h"

@implementation CGXCollectionCategoryHeaderView


- (void)initializeViews
{
    [super initializeViews];
    self.titleLabel  =[[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.layer.masksToBounds = YES;
    self.titleLabel.layer.borderWidth = 1;
    self.titleLabel.layer.borderColor = [UIColor colorWithWhite:0.93 alpha:1].CGColor;
    self.titleLabel.layer.cornerRadius = 4;
    [self addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self updateTitleLabel];
}
- (void)updateTitleLabel
{
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self addConstraint:top];
    [self addConstraint:left];
    [self addConstraint:right];
    [self addConstraint:bottom];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateTitleLabel];
}
- (void)updateWithCGXCollectionViewHeaderViewModel:(CGXCollectionCategoryBaseSectionModel *)sectionModel InSection:(NSInteger)section
{
    
}
@end
