//
//  CGXCollectionCategoryScrollerCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryScrollerCell.h"
@interface CGXCollectionCategoryScrollerCell()<SDCycleScrollViewDelegate>

@property (nonatomic , strong) SDCycleScrollView *adCycleScrollView;
@end
@implementation CGXCollectionCategoryScrollerCell
- (void)initializeViews
{
    [super initializeViews];
    // 轮播图
    self.adCycleScrollView  = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame)) delegate:self placeholderImage:[UIImage new]];
    self.adCycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    self.adCycleScrollView .scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.adCycleScrollView .currentPageDotColor = [UIColor redColor];
    self.adCycleScrollView .pageDotColor = [UIColor colorWithWhite:0.7 alpha:1];
    self.adCycleScrollView.pageControlDotSize = CGSizeMake(15, 15);  // pageControl小点的大小
    self.adCycleScrollView.showPageControl = YES;
    self.adCycleScrollView.hidesForSinglePage = NO;
    self.adCycleScrollView.pageControlBottomOffset = -8;
    self.adCycleScrollView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    [self.contentView addSubview:self.adCycleScrollView];
    [self.adCycleScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.adCycleScrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.top.equalTo(self.contentView.mas_top).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{
    self.contentView.backgroundColor = cellModel.cellColor;
    self.adCycleScrollView.localizationImageNamesGroup = @[@"",@"",@""];
}
#pragma mark - SDCycleScrollViewDelegate
// 点击轮播内容
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    [cycleScrollView adjustWhenControllerViewWillAppera];

}
@end
