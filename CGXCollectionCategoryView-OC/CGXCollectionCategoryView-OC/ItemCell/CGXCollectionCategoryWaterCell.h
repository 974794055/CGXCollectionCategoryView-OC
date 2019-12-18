//
//  CGXCollectionCategoryWaterCell.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseCell.h"
#import "CGXCollectionCategoryWaterView.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^CGXCollectionCategoryWaterCellHeightBlock)(CGFloat height);

@interface CGXCollectionCategoryWaterCell : CGXCollectionCategoryBaseCell

@property (nonatomic , strong) CGXCollectionCategoryWaterView *generalView;

/*
 自适应时高度
 */
@property(nonatomic,copy) CGXCollectionCategoryWaterCellHeightBlock heightBlock;
@end

NS_ASSUME_NONNULL_END
