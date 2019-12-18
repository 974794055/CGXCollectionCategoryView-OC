//
//  CGXCollectionCategoryBaseSectionView.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseSectionView.h"

@implementation CGXCollectionCategoryBaseSectionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeViews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeViews];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeViews];
    }
    return self;
}
- (void)initializeViews
{
    
}

@end
