//
//  CGXCollectionCategoryGeneralView.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryGeneralView.h"

@interface CGXCollectionCategoryGeneralView()

@end
@implementation CGXCollectionCategoryGeneralView

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
    self.collectionView.frame = self.bounds;
    [self.collectionView reloadData];
}

/*
 array：数据源
 pageCount:每次加载的个数
 pageSize：每页个数。默认10个
 */
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page
{
    [super updateDataArray:array IsDownRefresh:isDownRefresh Page:page];
    [self.collectionView reloadData];
}
- (CGXCollectionCategoryGeneralSectionModel *)pullSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel= [[CGXCollectionCategoryBaseSectionModel alloc] init];
    if (section>self.dataArray.count) {
        return (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
    }
    CGXCollectionCategoryBaseSectionModel *sectionModel = self.dataArray[section];
    CGXCollectionCategoryGeneralSectionModel *sectionM = (CGXCollectionCategoryGeneralSectionModel *)sectionModel;
    return sectionM;
}
- (CGXCollectionCategoryGeneralItemModel *)pullSectionModel:(CGXCollectionCategoryGeneralSectionModel *)sectionModel Row:(NSInteger)row
{
     CGXCollectionCategoryBaseItemModel *baseSectionModel= [[CGXCollectionCategoryBaseItemModel alloc] init];
    if (row>sectionModel.rowArr.count) {
        return (CGXCollectionCategoryGeneralItemModel *)baseSectionModel;
    }
    CGXCollectionCategoryBaseItemModel *item = sectionModel.rowArr[row];
    CGXCollectionCategoryGeneralItemModel *itemModel = (CGXCollectionCategoryGeneralItemModel *)item;
    return itemModel;
}
#pragma mark - 代理实现
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:insetForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self insetForSectionAtIndex:section];
    }
    if (self.isItemSpacingEequal) {
        return self.insets;
    } else{
        CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
        CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
        return sectionModel.insets;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:MinimumLineSpacingForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self MinimumLineSpacingForSectionAtIndex:section];
    }
    if (self.isItemSpacingEequal) {
        return self.minimumLineSpacing;
    }else{
        CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
        CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
        return sectionModel.minimumLineSpacing;
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:MinimumInteritemSpacingForSectionAtIndex:)]) {
        return [self.viewDelegate collectionViewCGXBaseView:self MinimumInteritemSpacingForSectionAtIndex:section];
    }
    if (self.isItemSpacingEequal) {
        return self.minimumInteritemSpacing;
    }else{
        CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
        CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
        return sectionModel.minimumInteritemSpacing;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
    if (!sectionModel.footerModel.isHaveFooter) {
        return CGSizeMake(0, 0);
    }
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:ReferenceSizeForfooterInSection:)]) {
        sectionModel.footerModel.footerHeight =[self.viewDelegate collectionViewCGXBaseView:self ReferenceSizeForfooterInSection:section];
    }
    return CGSizeMake(collectionView.bounds.size.width, sectionModel.footerModel.footerHeight);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[section];
    CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
    if (!sectionModel.headerModel.isHaveHeader) {
        return CGSizeMake(0, 0);
    }
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:ReferenceSizeForHeaderInSection:)]) {
        sectionModel.headerModel.headerHeight =[self.viewDelegate collectionViewCGXBaseView:self ReferenceSizeForHeaderInSection:section];
    }
    return CGSizeMake(collectionView.bounds.size.width, sectionModel.headerModel.headerHeight);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionCategoryBaseSectionModel *baseSectionModel =  self.dataArray[indexPath.section];
    CGXCollectionCategoryGeneralSectionModel *sectionModel = (CGXCollectionCategoryGeneralSectionModel *)baseSectionModel;
    CGXCollectionCategoryBaseItemModel *baseItem = sectionModel.rowArr[indexPath.row];
    CGXCollectionCategoryGeneralItemModel *item =  (CGXCollectionCategoryGeneralItemModel *)baseItem;
    
    UIEdgeInsets insets  = self.insets;
    CGFloat minimumInteritemSpacing = self.minimumInteritemSpacing;
    
    if (self.isItemSpacingEequal) {
       insets  = self.insets;
        minimumInteritemSpacing = self.minimumInteritemSpacing;
    } else{
        insets  = sectionModel.insets;
        minimumInteritemSpacing = sectionModel.minimumInteritemSpacing;
    }
    
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:insetForSectionAtIndex:)]) {
        insets =[self.viewDelegate collectionViewCGXBaseView:self insetForSectionAtIndex:indexPath.section];
    }
    
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:MinimumInteritemSpacingForSectionAtIndex:)]) {
        minimumInteritemSpacing = [self.viewDelegate collectionViewCGXBaseView:self MinimumInteritemSpacingForSectionAtIndex:indexPath.section];
    }
    CGFloat space = insets.left+insets.right;
    
    float cellWidth = (collectionView.bounds.size.width-space-(sectionModel.row -1)*minimumInteritemSpacing)/sectionModel.row;
    
    NSAssert(sectionModel.row > 0, @"每行至少一个item");

    return CGSizeMake(floor(cellWidth), item.cellHeight);
}



/*
 替换一个分区的数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel
{
    if (self.dataArray.count == 0) {
        return;
    }
    if (section>self.dataArray.count-1) {
        return;
    }
   
    __weak typeof(self) viewSelf = self;
    
    [self.collectionView performBatchUpdates:^{
         [viewSelf.dataArray replaceObjectAtIndex:section withObject:sectionModel];
       
    } completion:^(BOOL finished) {
         [viewSelf.collectionView reloadSections:[NSIndexSet indexSetWithIndex:section]];
        // 在此执行插入操作完成后的代码
    }];
//    [UIView performWithoutAnimation:^{
//        [viewSelf.collectionView reloadSections:[NSIndexSet indexSetWithIndex:section]];
//    }];
}
/*
 替换一个cell数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel;
{
    if (section>self.dataArray.count-1) {
        return;
    }
    CGXCollectionCategoryBaseSectionModel *sectionModel = [self pullSection:section];
    if (row>sectionModel.rowArr.count-1) {
        return;
    }

    __weak typeof(self) viewSelf = self;
//    [UIView performWithoutAnimation:^{
//       [viewSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
//    }];
    [self.collectionView performBatchUpdates:^{
        [sectionModel.rowArr replaceObjectAtIndex:row withObject:rowModel];
       
    } completion:^(BOOL finished) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [viewSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        // 在此执行插入操作完成后的代码
    }];
}

/*
 插入一个分区
 */
- (void)insertSections:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel
{
    [self insertSections:section withObject:sectionModel Animation:NO];
}
- (void)insertSections:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel Animation:(BOOL)animation
{
    if (self.dataArray.count == 0) {
        section = 0;
    }
    if (section>self.dataArray.count) {
        section = self.dataArray.count;
    }
    [self.dataArray insertObject:sectionModel atIndex:section];
    __weak typeof(self) viewSelf = self;
    if (animation) {
        [self.collectionView insertSections:[NSIndexSet indexSetWithIndex:section]];
    } else{
        [UIView performWithoutAnimation:^{
            [viewSelf.collectionView insertSections:[NSIndexSet indexSetWithIndex:section]];
        }];
    }
}

/*
 插入单行
 */
- (void)insertSections:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel
{
    [self insertSections:section RowIndex:row withObject:rowModel Animation:NO];
}
- (void)insertSections:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel Animation:(BOOL)animation
{
    NSLog(@"section-%ld  row-%ld",section,row);
    if (self.dataArray.count == 0) {
        return;
    }
    if (section>self.dataArray.count) {
        return;
    }
    CGXCollectionCategoryBaseSectionModel *sectionModel = [self pullSection:section];
    if (row>sectionModel.rowArr.count) {
        row = sectionModel.rowArr.count;
    }
    [sectionModel.rowArr insertObject:rowModel atIndex:row];
    NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:row inSection:section];
    __weak typeof(self) viewSelf = self;
    if (animation) {
        [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObjects:indexPathNew, nil]];
    } else{
        [UIView performWithoutAnimation:^{
            [viewSelf.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObjects:indexPathNew, nil]];
        }];
    }
}
@end
