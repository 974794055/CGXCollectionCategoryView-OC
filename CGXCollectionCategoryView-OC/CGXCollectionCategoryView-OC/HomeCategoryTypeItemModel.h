//
//  HomeCategoryTypeItemModel.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeCategoryTypeItemModel : NSObject

@property (nonatomic , strong) NSString *pic_width;
@property (nonatomic , strong) NSString *pic_height;
@property (nonatomic , strong) NSString *urlLink;
@property (nonatomic , strong) NSString *pictureLink;
@property (nonatomic , strong) NSString *title;



@property (nonatomic , strong) NSString *product_code;
@property (nonatomic , strong) NSString *salePrice;
@property (nonatomic , strong) NSString *goodsName;
@property (nonatomic , assign) NSInteger postID;
@property (nonatomic , assign) NSInteger priceID;
@property (nonatomic , strong) NSString *endPrice;
@property (nonatomic , strong) NSString *startPrice;


@end

NS_ASSUME_NONNULL_END
