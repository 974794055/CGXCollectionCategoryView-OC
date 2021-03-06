//
//  CGXCollectionCategoryHeaderView.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseSectionView.h"
#import "CGXCollectionCategoryUpdateHeaderDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CGXCollectionCategoryHeaderView : CGXCollectionCategoryBaseSectionView<CGXCollectionCategoryUpdateHeaderDelegate>

@property (nonatomic , strong) UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
