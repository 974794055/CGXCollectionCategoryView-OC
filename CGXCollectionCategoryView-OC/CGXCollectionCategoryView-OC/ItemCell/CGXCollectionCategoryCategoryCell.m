//
//  CGXCollectionCategoryCategoryCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryCategoryCell.h"

@implementation CGXCollectionCategoryCategoryCell
- (void)initializeViews
{
    [super initializeViews];
    self.titleLabel  =[[UILabel alloc] init];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
    }];
    self.covImageView = [[UIImageView alloc] init];
    self.covImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:self.covImageView];
    [self.covImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(0);
    }];
    
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
    }];
    [self.covImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(0);
    }];
}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{

}
@end
