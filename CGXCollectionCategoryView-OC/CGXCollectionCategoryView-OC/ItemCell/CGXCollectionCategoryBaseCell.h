//
//  CGXCollectionViewBaseCell.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXCollectionCategoryUpdateCellDelegate.h"
#import "CGXCollectionCategoryBaseItemModel.h"
NS_ASSUME_NONNULL_BEGIN


@interface CGXCollectionCategoryBaseCell : UICollectionViewCell<CGXCollectionCategoryUpdateCellDelegate>

@property (nonatomic, strong,readonly) CGXCollectionCategoryBaseItemModel *cellModel;
@property (nonatomic, strong,readonly) NSIndexPath *cellIndexPath;

- (void)initializeViews NS_REQUIRES_SUPER;

@end

NS_ASSUME_NONNULL_END
