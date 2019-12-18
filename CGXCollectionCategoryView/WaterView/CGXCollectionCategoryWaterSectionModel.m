//
//  CGXCollectionCategoryWaterSectionModel.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryWaterSectionModel.h"

@implementation CGXCollectionCategoryWaterSectionModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.rowArr = [[NSMutableArray alloc] init];
        self.headerModel = [[CGXCollectionCategoryWaterHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
        self.footerModel = [[CGXCollectionCategoryWaterFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
        self.row = 1;
    }
    return self;
}

@end
