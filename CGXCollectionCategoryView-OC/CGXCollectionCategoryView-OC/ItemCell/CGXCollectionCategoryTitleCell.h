//
//  CGXCollectionViewGeneralTitleCell.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseCell.h"
#import "CGXCollectionCategoryUpdateCellDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXCollectionCategoryTitleCell : CGXCollectionCategoryBaseCell<CGXCollectionCategoryUpdateCellDelegate>
@property (nonatomic , strong) UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
