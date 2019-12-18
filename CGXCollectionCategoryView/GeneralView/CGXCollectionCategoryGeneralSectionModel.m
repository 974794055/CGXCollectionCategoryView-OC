//
//  CGXCollectionCategoryGeneralSectionModel.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryGeneralSectionModel.h"

@implementation CGXCollectionCategoryGeneralSectionModel

- (void)initializeData
{
    [super initializeData];
    self.row = 1;
    self.headerModel = [[CGXCollectionCategoryGeneralHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
    self.footerModel = [[CGXCollectionCategoryGeneralFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
}

@end
