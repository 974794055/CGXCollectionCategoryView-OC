//
//  CGXCollectionCategoryWaterCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryWaterCell.h"

@interface CGXCollectionCategoryWaterCell ()<CGXCollectionCategoryUpdateViewDelegate>

@end

@implementation CGXCollectionCategoryWaterCell

- (void)initializeViews
{
    [super initializeViews];
    self.generalView = [[CGXCollectionCategoryWaterView alloc] init];
    self.generalView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.contentView addSubview:self.generalView];
    self.generalView.isAdaptive = YES;
    self.generalView.viewDelegate = self;
    [self.generalView registerCell:[CGXCollectionCategoryImageCell class] IsXib:NO];
    [self.generalView registerHeader:[UICollectionReusableView class] IsXib:NO];
    [self.generalView registerFooter:[UICollectionReusableView class] IsXib:NO];
    self.generalView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.generalView.showsHorizontalScrollIndicator = NO;
    self.generalView.showsVerticalScrollIndicator = NO;
    __weak typeof(self) weakSelf = self;
    self.generalView.heightBlock = ^(CGXCollectionCategoryBaseView * _Nonnull generalView, CGFloat height) {
        if (weakSelf.heightBlock) {
            weakSelf.heightBlock(height);
        }
    };

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.generalView.frame = self.bounds;
    [self.generalView.collectionView reloadData];
}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *dateAry = [NSMutableArray array];
    CGXCollectionCategoryWaterSectionModel *sectionModel = [[CGXCollectionCategoryWaterSectionModel alloc] init];
    sectionModel.row = 2;
    sectionModel.insets = UIEdgeInsetsMake(10, 10, 10, 10);
    sectionModel.minimumLineSpacing= 10;
    sectionModel.minimumInteritemSpacing = 10;
    NSMutableArray *itemArr = [NSMutableArray array];
    for (int j = 0; j<4; j++) {
        CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryImageCell class] IsXib:NO];
        if (j % 2 == 0) {
            item.cellHeight = 160;
        } else{
            item.cellHeight = 80;
        }
        [itemArr addObject:item];
    }
    sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
    [dateAry addObject:sectionModel];
    [self.generalView updateDataArray:dateAry IsDownRefresh:YES Page:1];
    [self.generalView setNeedsLayout];
    [self.generalView layoutIfNeeded];
}

/*
 点击cell
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(UICollectionViewCell *)cell DidSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"DidSelectItemAtIndexPath %@--%ld" ,cell,indexPath.row);
}

@end
