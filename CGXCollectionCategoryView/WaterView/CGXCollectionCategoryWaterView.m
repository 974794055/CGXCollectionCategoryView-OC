//
//  CGXCollectionCategoryWaterView.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryWaterView.h"
#import "CGXCollectionCategoryWaterLayout.h"
@interface CGXCollectionCategoryWaterView()<CGXCollectionCategoryWaterLayoutDataSource>

@end
@implementation CGXCollectionCategoryWaterView


- (void)initializeData
{
    [super initializeData];
     self.isAdaptive =NO;
}
- (void)initializeViews
{
    [super initializeViews];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    self.collectionView.frame = self.bounds;
//     [self.collectionView reloadData];
}
- (UICollectionViewLayout *)preferredFlowLayout
{
    [super preferredFlowLayout];
    CGXCollectionCategoryWaterLayout *layout = [[CGXCollectionCategoryWaterLayout alloc] init];
    layout.dataSource = self;
    layout.sectionFootersPinToVisibleBounds =NO;
    layout.sectionHeadersPinToVisibleBounds =NO;
    return layout;
}
/*
// array：数据源
// pageCount:每次加载的个数
// pageSize：每页个数。默认10个
// */
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page
{
    [super updateDataArray:array IsDownRefresh:isDownRefresh Page:page];
    [self.collectionView reloadData];
}
- (CGXCollectionCategoryWaterSectionModel *)pullSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel= [[CGXCollectionCategoryBaseSectionModel alloc] init];
    if (section>self.dataArray.count) {
        return (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    }
    CGXCollectionCategoryBaseSectionModel *sectionModel = self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionM = (CGXCollectionCategoryWaterSectionModel *)sectionModel;
    return sectionM;
}
- (CGXCollectionCategoryWaterItemModel *)pullSectionModel:(CGXCollectionCategoryWaterSectionModel *)sectionModel Row:(NSInteger)row
{
    CGXCollectionCategoryBaseItemModel *baseSectionModel= [[CGXCollectionCategoryBaseItemModel alloc] init];
    if (row>sectionModel.rowArr.count) {
        return (CGXCollectionCategoryWaterItemModel *)baseSectionModel;
    }
    CGXCollectionCategoryBaseItemModel *item = sectionModel.rowArr[row];
    CGXCollectionCategoryWaterItemModel *itemModel = (CGXCollectionCategoryWaterItemModel *)item;
    return itemModel;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    return sectionModel.rowArr.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout numberOfColumnInSection:(NSInteger)section {
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    return sectionModel.row;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout itemWidth:(CGFloat)width heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat myHeight = width;
    NSAssert(myHeight > 0, @"myHeight高度必须大于0");
    
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[indexPath.section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    CGXCollectionCategoryBaseItemModel *baseItem = sectionModel.rowArr[indexPath.row];
    CGXCollectionCategoryWaterItemModel *item =  (CGXCollectionCategoryWaterItemModel *)baseItem;
    myHeight = item.cellHeight;
    return CGSizeMake(width, myHeight);
}
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout IsParityAItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[indexPath.section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    if (sectionModel.isParityAItem) {
        if (indexPath.row % 2 == 0) {
            return NO;
        } else{
            return YES;
        }
    }
    return NO;
}
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout IsParityFlowAtInSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    return sectionModel.isParityFlow;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout referenceHeightForFooterInSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    if (!sectionModel.footerModel.isHaveFooter) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(collectionView.frame.size.width, sectionModel.footerModel.footerHeight) ;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout referenceHeightForHeaderInSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryWaterSectionModel *sectionModel = (CGXCollectionCategoryWaterSectionModel *)baseSectionModel;
    if (!sectionModel.headerModel.isHaveHeader) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(collectionView.frame.size.width, sectionModel.headerModel.headerHeight) ;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout insetForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:insetForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self insetForSectionAtIndex:section];
    }
    return self.insets;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout *)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:MinimumLineSpacingForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self MinimumLineSpacingForSectionAtIndex:section];
    }
    return self.minimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:MinimumInteritemSpacingForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self MinimumInteritemSpacingForSectionAtIndex:section];
    }
    return self.minimumInteritemSpacing;
}


/*
 替换一个分区的数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section withObject:(CGXCollectionCategoryWaterSectionModel *)sectionModel
{
    if (self.dataArray.count == 0) {
        return;
    }
    if (section>self.dataArray.count-1) {
        return;
    }
    [self.dataArray replaceObjectAtIndex:section withObject:sectionModel];
    __weak typeof(self) viewSelf = self;
    [UIView animateWithDuration:0 animations:^{
        [viewSelf.collectionView performBatchUpdates:^{
            [viewSelf.collectionView reloadSections:[NSIndexSet indexSetWithIndex:section]];
        } completion:nil];
    }];
}
/*
 替换一个cell数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryWaterItemModel *)rowModel;
{
    if (section>self.dataArray.count-1) {
        return;
    }
    CGXCollectionCategoryBaseSectionModel *sectionModel = [self pullSection:section];
    if (row>sectionModel.rowArr.count-1) {
        return;
    }
    [sectionModel.rowArr replaceObjectAtIndex:row withObject:rowModel];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    __weak typeof(self) viewSelf = self;
    [UIView animateWithDuration:0 animations:^{
        [viewSelf.collectionView performBatchUpdates:^{
            [viewSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }];
}

@end
