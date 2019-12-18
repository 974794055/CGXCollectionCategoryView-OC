//
//  CGXWaterViewTool.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXWaterViewTool.h"

@implementation CGXWaterViewTool
//处理数据源
+ (NSMutableArray<CGXCollectionCategoryWaterSectionModel *> *)loadDealWithList
{
    NSMutableArray *dateAry = [NSMutableArray array];
    int x = 8;
    for (int i = 0; i<x; i++) {
        CGXCollectionCategoryWaterSectionModel *sectionModel = [[CGXCollectionCategoryWaterSectionModel alloc] init];
        
        sectionModel.footerModel = [[CGXCollectionCategoryWaterFooterModel alloc] initWithFooterClass:[UICollectionReusableView class] IsXib:NO];
        sectionModel.footerModel.footerModel = @"脚步";
        sectionModel.footerModel.footerHeight = 30;
        sectionModel.footerModel.footerBgColor = [UIColor yellowColor];
        
        sectionModel.headerModel= [[CGXCollectionCategoryWaterHeaderModel alloc] initWithHeaderClass:[UICollectionReusableView class] IsXib:NO];
        sectionModel.headerModel.headerModel = @"头部";
        sectionModel.headerModel.headerHeight = 44;
        
        sectionModel.headerModel.headerBgColor = [UIColor orangeColor];
        sectionModel.row = 1;
        
        NSMutableArray *itemArr = [NSMutableArray array];
        if (i == 0) {
            sectionModel.row = 5;
            for (int j = 0; j<10; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                item.cellHeight = 100;
                [itemArr addObject:item];
            }
        }else if (i == 1){
            sectionModel.row = 2;
            for (int j = 0; j<4; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                if (j % 2 == 0) {
                    item.cellHeight = 160;
                } else{
                    item.cellHeight = 80;
                }
                [itemArr addObject:item];
            }
        }else if (i == 2){
            sectionModel.row = 3;
            for (int j = 0; j<6; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                item.cellHeight = 160;
                
                [itemArr addObject:item];
            }
            
        }else if (i == 3){
            sectionModel.row = 4;
            for (int j = 0; j<23; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                if (j == 0) {
                    item.cellHeight = 110;
                } else{
                    item.cellHeight = 50;
                }
                [itemArr addObject:item];
            }
            
        }else if (i == 4){
            sectionModel.row = 4;
            for (int j = 0; j<23; j++) {
                CGXCollectionCategoryWaterItemModel *item =[[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                if (j == 0) {
                    item.cellHeight = 110;
                } else{
                    item.cellHeight = 30;
                }
                
                [itemArr addObject:item];
            }
            
        }else if (i == 5){
            sectionModel.row = 2;
            for (int j = 0; j<3; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                if (j == 0) {
                    item.cellHeight = 210;
                } else{
                    item.cellHeight = 100;
                }
                
                [itemArr addObject:item];
            }
        }else if (i == 6){
            sectionModel.row = 2;
            for (int j = 0; j<3; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                if (j == 0) {
                    item.cellHeight = 100;
                }else if (j==1){
                    item.cellHeight = 210;
                }else{
                    item.cellHeight = 100;
                }
                
                [itemArr addObject:item];
            }
        }else{
            sectionModel.row = 3;
            for (int j = 0; j<9; j++) {
                CGXCollectionCategoryWaterItemModel *item = [[CGXCollectionCategoryWaterItemModel alloc] initWithCelllass:[CGXCollectionCategoryTitleCell class] IsXib:NO];
                item.dataModel= @"str";
                item.cellHeight = 120;
                [itemArr addObject:item];
            }
        }
        sectionModel.rowArr = [NSMutableArray arrayWithArray:itemArr];
        [dateAry addObject:sectionModel];
    }
    return dateAry;
}
@end
