//
//  CGXGeneralViewTool.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGXCollectionCategoryGeneralSectionModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface CGXGeneralViewTool : NSObject

//处理数据源
+ (NSMutableArray<CGXCollectionCategoryGeneralSectionModel *> *)loadDealWithList;

//替换
+ (CGXCollectionCategoryGeneralSectionModel *)replaceObjectAtSection:(NSInteger)section;

//插入一个分区
+ (CGXCollectionCategoryGeneralSectionModel *)insertObjectAtSection:(NSInteger)section;

//插入一个cell
+ (CGXCollectionCategoryGeneralSectionModel *)insertObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row;
@end

NS_ASSUME_NONNULL_END
