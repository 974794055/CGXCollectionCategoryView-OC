//
//  CGXCollectionCategoryUpdateFooterDelegate.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CGXCollectionCategoryBaseSectionModel.h"
@class CGXCollectionCategoryBaseSectionModel;
NS_ASSUME_NONNULL_BEGIN

@protocol CGXCollectionCategoryUpdateFooterDelegate <NSObject>

@required

@optional

- (void)updateWithCGXCollectionViewFooterViewModel:(CGXCollectionCategoryBaseSectionModel *)sectionModel InSection:(NSInteger)section;

@end

NS_ASSUME_NONNULL_END
