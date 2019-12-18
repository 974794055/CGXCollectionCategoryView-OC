//
//  CGXCollectionCategoryGeneralView.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseView.h"
#import "CGXCollectionCategoryGeneralSectionModel.h"
NS_ASSUME_NONNULL_BEGIN


@class CGXCollectionCategoryGeneralView;


@interface CGXCollectionCategoryGeneralView : CGXCollectionCategoryBaseView

/*
 获取分区数据源
 */
- (CGXCollectionCategoryGeneralSectionModel *)pullSection:(NSInteger)section;
/*
 获取每个cell数据源
 */
- (CGXCollectionCategoryGeneralItemModel *)pullSectionModel:(CGXCollectionCategoryGeneralSectionModel *)sectionModel Row:(NSInteger)row;
/*
 替换一个分区的数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel;
/*
 替换一个cell数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel;

/*
 插入一个分区  当数据源数组为0时，默认设置插入到第一个
 */
- (void)insertSections:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel;
- (void)insertSections:(NSInteger)section withObject:(CGXCollectionCategoryGeneralSectionModel *)sectionModel Animation:(BOOL)animation;
/*
 插入单行  越界 row越界 插入到末尾处
 */
- (void)insertSections:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel;
- (void)insertSections:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryGeneralItemModel *)rowModel Animation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
