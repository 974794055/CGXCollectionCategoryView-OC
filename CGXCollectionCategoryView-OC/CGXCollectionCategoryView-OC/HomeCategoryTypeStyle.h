//
//  HomeCategoryTypeStyle.h
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#ifndef HomeCategoryTypeStyle_h
#define HomeCategoryTypeStyle_h

typedef NS_ENUM(NSInteger, HomeCategoryTypeModelType) {
    HomeCategoryTypeModelTypeNode,     //留白分区   CGXCollectionCategoryNodeCell 无cell
    HomeCategoryTypeModelTypeSearch,       //搜索  CGXCollectionCategorySearchCell
    HomeCategoryTypeModelTypeScroller,     //轮播图。   CGXCollectionCategoryScrollerCell
    HomeCategoryTypeModelTypeCategory,     //分类      CGXCollectionCategoryCategoryCell
    HomeCategoryTypeModelTypeMoreGoods ,   //左右滑动   CGXCollectionCategoryMoreGoodsCell
    HomeCategoryTypeModelTypeListTitle,    //只有文字 等高   CGXCollectionCategoryTitleCell
    HomeCategoryTypeModelTypeListImage,    //只有图片 等高   CGXCollectionCategoryImageCell
    HomeCategoryTypeModelTypeWaterfall,    //瀑布流布局 只有图片  CGXCollectionCategoryWaterCell
    HomeCategoryTypeModelTypeNormal,       //图文混排时布局     CGXCollectionCategoryNormalCell
};

#endif /* HomeCategoryTypeStyle_h */
