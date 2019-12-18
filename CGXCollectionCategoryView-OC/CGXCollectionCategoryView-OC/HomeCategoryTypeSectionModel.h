//
//  HomeCategoryTypeSectionModel.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeCategoryTypeItemModel.h"
#import "HomeCategoryTypeStyle.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeCategoryTypeSectionModel : NSObject

@property (nonatomic , strong) NSString *pic_width;
@property (nonatomic , strong) NSString *pic_height;
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSString *pictureLink;
@property (nonatomic , strong) NSString *type;
@property (nonatomic , assign) NSInteger showType;
@property (nonatomic , strong) NSString *urlLink;
@property (nonatomic , strong) NSArray *list;
@property (nonatomic , strong) NSArray *goods;
@end

NS_ASSUME_NONNULL_END
