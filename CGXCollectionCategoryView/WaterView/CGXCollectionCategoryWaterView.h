//
//  CGXCollectionCategoryWaterView.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseView.h"
#import "CGXCollectionCategoryWaterSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@class CGXCollectionCategoryWaterView;

@interface CGXCollectionCategoryWaterView : CGXCollectionCategoryBaseView

/*
 获取分区数据源
 */
- (CGXCollectionCategoryWaterSectionModel *)pullSection:(NSInteger)section;
/*
 获取每个cell数据源
 */
- (CGXCollectionCategoryWaterItemModel *)pullSectionModel:(CGXCollectionCategoryWaterSectionModel *)sectionModel Row:(NSInteger)row;
/*
 替换一个分区的数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section withObject:(CGXCollectionCategoryWaterSectionModel *)sectionModel;
/*
 替换一个cell数据源
 */
- (void)replaceObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row withObject:(CGXCollectionCategoryWaterItemModel *)rowModel;

@end

NS_ASSUME_NONNULL_END
