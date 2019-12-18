//
//  CGXGeneralViewTool.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXGeneralViewTool.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@implementation CGXGeneralViewTool

+ (CGXCollectionCategoryGeneralHeaderModel *)creatHeadModel:(Class)class IsXib:(BOOL)isXib
{
    CGXCollectionCategoryGeneralHeaderModel *headerModel = [[CGXCollectionCategoryGeneralHeaderModel alloc] initWithHeaderClass:class IsXib:NO];
    headerModel.headerBgColor = [UIColor orangeColor];
    return headerModel;
}
//处理数据源
+ (NSMutableArray<CGXCollectionCategoryGeneralSectionModel *> *)loadDealWithList
{
    
    NSMutableArray *typeAry = [NSMutableArray arrayWithObjects:
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeNode],//留白分区   CGXCollectionCategoryNodeCell 无cell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeSearch],//搜索  CGXCollectionCategorySearchCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeScroller], //轮播图。   HomeCategoryScrollerCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeCategory],//分类      CGXCollectionCategoryCategoryCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeMoreGoods], //左右滑动   CGXCollectionCategoryMoreGoodsCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeListTitle],//只有文字 等高   CGXCollectionCategoryTitleCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeListImage],//只有图片 等高   CGXCollectionCategoryImageCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeWaterfall],//瀑布流布局 只有图片  CGXCollectionCategoryWaterCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeNormal], //图文混排时布局     CGXCollectionCategoryNormalCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeNode],//留白分区   CGXCollectionCategoryNodeCell 无cell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeSearch],//搜索  CGXCollectionCategorySearchCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeScroller], //轮播图。   HomeCategoryScrollerCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeCategory],//分类      CGXCollectionCategoryCategoryCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeMoreGoods], //左右滑动   CGXCollectionCategoryMoreGoodsCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeListTitle],//只有文字 等高   CGXCollectionCategoryTitleCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeListImage],//只有图片 等高   CGXCollectionCategoryImageCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeWaterfall],//瀑布流布局 只有图片  CGXCollectionCategoryWaterCell
                               [NSNumber numberWithInt:HomeCategoryTypeModelTypeNormal], //图文混排时布局     CGXCollectionCategoryNormalCell
                               nil];
    NSMutableArray *dateAry = [NSMutableArray array];
    for (int i = 0; i<typeAry.count; i++) {
        NSInteger type = [typeAry[i] integerValue];
        CGXCollectionCategoryGeneralSectionModel *sectionModel = [[CGXCollectionCategoryGeneralSectionModel alloc] init];
        sectionModel.row = 1;
        sectionModel.insets = UIEdgeInsetsMake(10, 10, 10, 10);
        sectionModel.minimumLineSpacing= 10;
        sectionModel.minimumInteritemSpacing = 10;
        NSMutableArray *itemArr = [NSMutableArray array];
        switch (type) {
            case HomeCategoryTypeModelTypeNode:
            {
                sectionModel.insets = UIEdgeInsetsMake(0, 0, 0, 0);
                sectionModel.minimumLineSpacing= 0;
                sectionModel.minimumInteritemSpacing = 0;
                CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryNodeCell class] IsXib:NO];
                sectionModel.row = 1;
                item.cellHeight = 20;
                item.cellColor = [UIColor orangeColor];
                [itemArr addObject:item];
            }
                break;
            case HomeCategoryTypeModelTypeSearch:
            {
                sectionModel.insets = UIEdgeInsetsMake(0, 0, 0, 0);
                sectionModel.minimumLineSpacing= 0;
                sectionModel.minimumInteritemSpacing = 0;
                CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategorySearchCell class] IsXib:NO];
                sectionModel.row = 1;
                item.cellHeight = 50;
                item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                [itemArr addObject:item];
            }
                break;
            case HomeCategoryTypeModelTypeScroller:
            {
                sectionModel.insets = UIEdgeInsetsMake(0, 0, 0, 0);
                sectionModel.minimumLineSpacing= 0;
                sectionModel.minimumInteritemSpacing = 0;
                CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryScrollerCell class] IsXib:NO];
                sectionModel.row = 1;
                item.cellHeight = [UIScreen mainScreen].bounds.size.width;
                item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                [itemArr addObject:item];
            }
                break;
            case HomeCategoryTypeModelTypeCategory:
            {
                  sectionModel.row = 5;
                for (int i= 0 ; i<10; i++) {
                    CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryCategoryCell class] IsXib:NO];
                    item.cellHeight = 120;
                    item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                    [itemArr addObject:item];
                }
            }
                break;
            case HomeCategoryTypeModelTypeMoreGoods:
            {
                CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryMoreGoodsCell class] IsXib:NO];
                sectionModel.row = 1;
                item.cellHeight = 200;
                item.cellColor = [UIColor whiteColor];;
                [itemArr addObject:item];
            }
                break;
            case HomeCategoryTypeModelTypeListTitle:
            {
                sectionModel.row = 4;
                for (int i= 0 ; i<12; i++) {
                    CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                    item.cellHeight = 120;
                    item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                    [itemArr addObject:item];
                }
            }
                break;
            case HomeCategoryTypeModelTypeListImage:
            {
                sectionModel.row = 3;
                for (int i= 0 ; i<9; i++) {
                    CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryImageCell class] IsXib:NO];
                    item.cellHeight = 120;
                    item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                    [itemArr addObject:item];
                }
            }
                break;
            case HomeCategoryTypeModelTypeWaterfall:
            {
                sectionModel.insets = UIEdgeInsetsMake(0, 0, 0, 0);
                sectionModel.minimumLineSpacing= 0;
                sectionModel.minimumInteritemSpacing = 0;
                sectionModel.row = 1;
                CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryWaterCell class] IsXib:NO];
                item.cellHeight = 100;
                item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                [itemArr addObject:item];
            }
                break;
            case HomeCategoryTypeModelTypeNormal:
            {
                sectionModel.row = 3;

                for (int i= 0 ; i<12; i++) {
                    CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryNormalCell class] IsXib:NO];
                    item.cellHeight = 100;
                    item.cellColor = [UIColor colorWithWhite:0.93 alpha:1];;
                    [itemArr addObject:item];
                }
            }
                break;
                
            default:
                break;
        }
         sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
        [dateAry addObject:sectionModel];
    }
    return dateAry;
}


+ (CGXCollectionCategoryGeneralSectionModel *)replaceObjectAtSection:(NSInteger)section
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [[CGXCollectionCategoryGeneralSectionModel alloc] init];
    sectionModel.row = 2;
    sectionModel.headerModel = [[CGXCollectionCategoryGeneralHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.headerModel.headerHeight = 40;
    
    sectionModel.headerModel.headerModel = [NSString stringWithFormat:@"头部-%d",0];
    sectionModel.headerModel.headerTag = 10000;
    sectionModel.headerModel.headerBgColor = [UIColor orangeColor];
    
    sectionModel.footerModel = [[CGXCollectionCategoryGeneralFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.footerModel.footerModel = [NSString stringWithFormat:@"脚部-%d",0];
    sectionModel.footerModel.footerTag = 20000;
    sectionModel.footerModel.footerHeight  = 40;
    sectionModel.footerModel.footerBgColor = [UIColor yellowColor];
    
    CGFloat height = arc4random() % 20+80;
    CGFloat row = arc4random() % 2+2;
    NSMutableArray *itemArr = [NSMutableArray array];
    for (int i= 0 ; i<10; i++) {
        CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryImageCell class] IsXib:NO];
        sectionModel.row = row;
        item.dataModel= @"";
        item.cellHeight = height;
        item.cellColor = randomColor;
        [itemArr addObject:item];
    }
    sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
    return sectionModel;
}
//插入一个分区
+ (CGXCollectionCategoryGeneralSectionModel *)insertObjectAtSection:(NSInteger)section
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [[CGXCollectionCategoryGeneralSectionModel alloc] init];
    sectionModel.row = 2;
    sectionModel.headerModel = [[CGXCollectionCategoryGeneralHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.headerModel.headerHeight = 40;
    
    sectionModel.headerModel.headerModel = [NSString stringWithFormat:@"头部-%d",0];
    sectionModel.headerModel.headerTag = 10000;
    sectionModel.headerModel.headerBgColor = [UIColor orangeColor];
    
    sectionModel.footerModel = [[CGXCollectionCategoryGeneralFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.footerModel.footerModel = [NSString stringWithFormat:@"脚部-%d",0];
    sectionModel.footerModel.footerTag = 20000;
    sectionModel.footerModel.footerHeight  = 40;
    sectionModel.footerModel.footerBgColor = [UIColor yellowColor];
    
    CGFloat height = 80;
    CGFloat row = arc4random() % 2+2;
    NSMutableArray *itemArr = [NSMutableArray array];
    for (int i= 0 ; i<row*2; i++) {
        CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryImageCell class] IsXib:NO];
        sectionModel.row = row;
        item.dataModel= @"";
        item.cellHeight = height;
        item.cellColor = randomColor;
        [itemArr addObject:item];
    }
    sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
    return sectionModel;
}
//插入一个cell
+ (CGXCollectionCategoryGeneralSectionModel *)insertObjectAtSection:(NSInteger)section RowIndex:(NSInteger)row
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [[CGXCollectionCategoryGeneralSectionModel alloc] init];
    sectionModel.row = 2;
    sectionModel.headerModel = [[CGXCollectionCategoryGeneralHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.headerModel.headerHeight = 40;
    
    sectionModel.headerModel.headerModel = [NSString stringWithFormat:@"头部-%d",0];
    sectionModel.headerModel.headerTag = 10000;
    sectionModel.headerModel.headerBgColor = [UIColor orangeColor];
    
    sectionModel.footerModel = [[CGXCollectionCategoryGeneralFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
    sectionModel.footerModel.footerModel = [NSString stringWithFormat:@"脚部-%d",0];
    sectionModel.footerModel.footerTag = 20000;
    sectionModel.footerModel.footerHeight  = 40;
    sectionModel.footerModel.footerBgColor = [UIColor yellowColor];
    
    CGFloat height = 80;
    NSMutableArray *itemArr = [NSMutableArray array];
    for (int i= 0 ; i<1; i++) {
        CGXCollectionCategoryGeneralItemModel *item = [[CGXCollectionCategoryGeneralItemModel alloc] initWithCelllass:[CGXCollectionCategoryImageCell class] IsXib:NO];
        sectionModel.row = row;
        item.dataModel= @"";
        item.cellHeight = height;
        item.cellColor = randomColor;
        [itemArr addObject:item];
    }
    sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
    return sectionModel;
}
@end
