//
//  CGXCollectionCategoryBaseItemModel.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseItemModel.h"

@interface CGXCollectionCategoryBaseItemModel()

//默认不适用xib
@property (nonatomic , assign,readwrite) BOOL isXib;
@property(nonatomic, strong,readwrite) Class cellClass;

@end

@implementation CGXCollectionCategoryBaseItemModel

- (NSString *)cellIdentifier {
    return [NSString stringWithFormat:@"%@", self.cellClass];
}

/*
 初始化方法
 */
- (instancetype)initWithCelllass:(Class)cellClass IsXib:(BOOL)isXib
{
    self = [super init];
    if (self) {
        self.isXib = NO;
        self.cellColor = [UIColor whiteColor];
        self.cellHeight = 100;
        self.isSelectCell = NO;
        self.cellClass = cellClass;
    }
    return self;
}
@end
