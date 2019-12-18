//
//  CGXCollectionViewGeneralCellUpdateDelegate.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CGXCollectionCategoryBaseItemModel.h"
@class CGXCollectionCategoryBaseItemModel;
NS_ASSUME_NONNULL_BEGIN

@protocol CGXCollectionCategoryUpdateCellDelegate <NSObject>

@required

@optional

- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath*)indexPath;

@end

NS_ASSUME_NONNULL_END
