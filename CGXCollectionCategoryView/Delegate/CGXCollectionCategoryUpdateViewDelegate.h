//
//  CGXCollectionCategoryUpdateViewDelegate.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@class CGXCollectionCategoryBaseView;

@protocol CGXCollectionCategoryUpdateViewDelegate <NSObject>

@required

@optional

/*
  展示cell 处理数据
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(UICollectionViewCell *)cell cellForItemAtIndexPath:(NSIndexPath *)indexPath;
/*
 点击cell
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(UICollectionViewCell *)cell DidSelectItemAtIndexPath:(NSIndexPath *)indexPath;

/*
 显示头分区
 */
- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView ReferenceSizeForHeaderInSection:(NSInteger)section;
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView AtIndexPath:(NSIndexPath *)indexPath SectionHeaderView:(UICollectionReusableView *)headerView;

/*
 显示脚分区
 */
- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView ReferenceSizeForfooterInSection:(NSInteger)section;
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView AtIndexPath:(NSIndexPath *)indexPath SectionFooterView:(UICollectionReusableView *)footerView;

/// Column spacing between columns
- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView MinimumLineSpacingForSectionAtIndex:(NSInteger)section;
/// The spacing between rows and rows
- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView MinimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (UIEdgeInsets)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView insetForSectionAtIndex:(NSInteger)section;

/*
 返回封装view的自适应高度。自适应高度时使用
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView WithViewHeight:(CGFloat)height;

/*
   点击头分区
 */

- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView TapHeaderViewAtIndex:(NSInteger)section;;
/*
   点击脚分区
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView TapFooterViewAtIndex:(NSInteger)section;;
/*
   滚动
 */
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView DropUpDownDidChanged:(CGPoint)contentOffset;


@end

NS_ASSUME_NONNULL_END
