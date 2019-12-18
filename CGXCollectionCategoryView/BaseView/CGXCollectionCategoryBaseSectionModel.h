//
//  CGXCollectionCategoryBaseSectionModel.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CGXCollectionCategoryBaseFooterModel.h"
#import "CGXCollectionCategoryBaseItemModel.h"
#import "CGXCollectionCategoryBaseHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CGXCollectionCategoryBaseSectionModel : NSObject

- (void)initializeData NS_REQUIRES_SUPER;

/*
 头分区
 */
@property (nonatomic , strong) CGXCollectionCategoryBaseHeaderModel *headerModel;
/*
 脚分区
 */
@property (nonatomic , strong) CGXCollectionCategoryBaseFooterModel *footerModel;

//每个cell的数据
@property (nonatomic, strong) NSMutableArray<CGXCollectionCategoryBaseItemModel *> *rowArr;

@property (nonatomic , assign) NSInteger minimumLineSpacing;//默认是10
@property (nonatomic , assign) NSInteger minimumInteritemSpacing;//默认是10
@property (nonatomic) UIEdgeInsets insets;//默认是10

@property (nonatomic , strong) id dataModel;//原始数据

@end

NS_ASSUME_NONNULL_END
