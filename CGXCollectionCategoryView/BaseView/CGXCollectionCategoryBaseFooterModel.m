//
//  CGXCollectionCategoryBaseFooterModel.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseFooterModel.h"

@interface CGXCollectionCategoryBaseFooterModel()

@property (nonatomic , assign,readwrite) BOOL footerXib;
@property (nonatomic, strong,readwrite) Class footerClass;
@end
@implementation CGXCollectionCategoryBaseFooterModel

- (instancetype)initWithFooterClass:(Class)footerClass IsXib:(BOOL)isXib
{
    self = [super init];
    if (self) {
        NSAssert(![footerClass isKindOfClass:[UICollectionReusableView class]], @"分区脚view必须是UICollectionReusableViewk类型");
        self.footerClass = footerClass;
        self.footerXib = isXib;
        self.footerHeight = 10;
        self.footerTag = 0;
        self.footerBgColor = [UIColor colorWithRed:241/255.0 green:241/255.0 blue:241/255.0 alpha:1];
        self.isHaveFooter = YES;
    }
    return self;
}
- (NSString *)footerIdentifier
{

    return [NSString stringWithFormat:@"%@", self.footerClass];
}

@end
