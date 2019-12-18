//
//  UIView+CGXTableViewgeneralTap.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CGXCollectionViewTap)<UIGestureRecognizerDelegate>

@property (nonatomic,assign) void(^block)(NSInteger tag);

- (void)addTapGestureRecognizerWithDelegate:(id)tapGestureDelegate Block:(void(^)(NSInteger tag))block;
@end

NS_ASSUME_NONNULL_END
