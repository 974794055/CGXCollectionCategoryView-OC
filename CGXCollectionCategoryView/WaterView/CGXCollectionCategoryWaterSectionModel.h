//
//  CGXCollectionCategoryWaterSectionModel.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseSectionModel.h"
#import "CGXCollectionCategoryWaterItemModel.h"
#import "CGXCollectionCategoryWaterHeaderModel.h"
#import "CGXCollectionCategoryWaterFooterModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXCollectionCategoryWaterSectionModel : CGXCollectionCategoryBaseSectionModel

// 此方法排列方式  偶数下标在左边。奇数下标在右边。 两列情况下使用
@property (nonatomic , assign) BOOL isParityAItem;

 //某个分区是否是奇偶瀑布流排布
@property (nonatomic , assign) BOOL isParityFlow;


@property (nonatomic , assign) NSInteger row;//默认每行一个

@end

NS_ASSUME_NONNULL_END
