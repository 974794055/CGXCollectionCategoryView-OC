//
//  CGXWaterViewTool.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CGXCollectionCategoryWaterSectionModel.h"
#import "CGXCollectionCategoryTitleCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXWaterViewTool : NSObject
//处理数据源
+ (NSMutableArray<CGXCollectionCategoryWaterSectionModel *> *)loadDealWithList;
@end

NS_ASSUME_NONNULL_END
