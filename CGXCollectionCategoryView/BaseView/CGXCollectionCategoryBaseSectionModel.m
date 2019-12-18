//
//  CGXCollectionCategoryBaseSectionModel.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseSectionModel.h"

@implementation CGXCollectionCategoryBaseSectionModel


- (instancetype)init {
    self = [super init];
    if (self) {
        [self initializeData];
    }
    return self;
}
- (void)initializeData
{
    self.rowArr = [[NSMutableArray alloc] init];
    self.headerModel = [[CGXCollectionCategoryBaseHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
    self.footerModel = [[CGXCollectionCategoryBaseFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
    self.insets =UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
}
@end
