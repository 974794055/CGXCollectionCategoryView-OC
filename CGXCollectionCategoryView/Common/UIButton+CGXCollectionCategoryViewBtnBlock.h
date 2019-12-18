//
//  UIButton+CGXTableViewGeneralBtnBlock.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIButton (CGXCollectionCategoryBtnBlock)

@property(nonatomic ,copy)void(^block)(UIButton*);

-(void)addGXTapBlock:(void(^)(UIButton*btn))block;

@end

NS_ASSUME_NONNULL_END
