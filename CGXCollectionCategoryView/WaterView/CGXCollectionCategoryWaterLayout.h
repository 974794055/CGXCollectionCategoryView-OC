//
//  CGXCollectionCategoryWaterLayout.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CGXCollectionCategoryWaterLayoutDataSource;

@interface CGXCollectionCategoryWaterLayout : UICollectionViewLayout

@property (nonatomic, weak) id<CGXCollectionCategoryWaterLayoutDataSource> dataSource;

@property (nonatomic, assign) CGFloat minimumLineSpacing; // default 0.0
@property (nonatomic, assign) CGFloat minimumInteritemSpacing; // default 0.0
@property (nonatomic, assign) IBInspectable BOOL sectionHeadersPinToVisibleBounds;
// default NO
@property (nonatomic, assign) IBInspectable BOOL sectionFootersPinToVisibleBounds;

@end


#pragma mark -

@protocol CGXCollectionCategoryWaterLayoutDataSource<NSObject>

@required
/// Return per section's column number(must be greater than 0).
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout numberOfColumnInSection:(NSInteger)section;
/// Return per item's height   高度设置无效 等宽的
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout itemWidth:(CGFloat)width heightForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/// Column spacing between columns
//   此方法排列方式  偶数下标在左边。奇数下标在右边。   两列情况下使用
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout IsParityAItemAtIndexPath:(NSIndexPath *)indexPath;
/*
 某个分区是否是奇偶瀑布流排布
 */
- (BOOL)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout IsParityFlowAtInSection:(NSInteger)section;

/// Column spacing between columns
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
/// The spacing between rows and rows
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
///
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout insetForSectionAtIndex:(NSInteger)section;
/// Return per section header view height.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout referenceHeightForHeaderInSection:(NSInteger)section;
/// Return per section footer view height.
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(CGXCollectionCategoryWaterLayout*)layout referenceHeightForFooterInSection:(NSInteger)section;

@end
