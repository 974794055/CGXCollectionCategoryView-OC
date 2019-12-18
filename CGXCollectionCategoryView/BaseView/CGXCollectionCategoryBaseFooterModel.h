//
//  CGXCollectionCategoryBaseFooterModel.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CGXCollectionCategoryBaseFooterModel : NSObject

/*
 初始化方法  Class类型 [UICollectionReusableView class]
 */
- (instancetype)initWithFooterClass:(Class)footerClass IsXib:(BOOL)isXib;
/*
 //类型 UICollectionReusableView 类
 */
@property (nonatomic , strong,readonly) NSString *footerIdentifier;
/*
 //Class类型 [UICollectionReusableView class]
 */
@property (nonatomic, strong,readonly) Class footerClass;
/*
 是否是xib创建
 */
@property (nonatomic , assign,readonly) BOOL footerXib;
/*
 高度
 */
@property (nonatomic , assign) CGFloat footerHeight;
/*
 颜色
 */
@property (nonatomic , strong) UIColor *footerBgColor;
/*
 原始数据
 */
@property (nonatomic , strong) id footerModel;
/*
 设置标签值 默认0
 */
@property (nonatomic , assign) NSInteger footerTag;
/*
 是否有脚分区
 */
@property (nonatomic , assign) BOOL isHaveFooter;
@end

NS_ASSUME_NONNULL_END
