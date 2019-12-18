//
//  CGXGeneralViewController.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXGeneralViewController.h"

#import "CGXCollectionCategoryGeneralView.h"
#import "CGXCollectionCategoryImageCell.h"
#import "CGXCollectionCategoryTitleCell.h"
#import "CGXGeneralViewTool.h"
#import "CGXCollectionCategoryHeaderView.h"
#import "CGXCollectionCategoryFooterView.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@interface CGXGeneralViewController ()<CGXCollectionCategoryUpdateViewDelegate>

@property (nonatomic , strong) CGXCollectionCategoryGeneralView *generalView;

@end

@implementation CGXGeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"一般";
    __weak typeof(self) weakSelf = self;
    self.generalView = [[CGXCollectionCategoryGeneralView alloc] init];
    self.generalView.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-([[UIApplication sharedApplication] statusBarFrame].size.height+44)-([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49));
    [self.view addSubview:self.generalView];
    [self.generalView registerCell:[UICollectionViewCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryNodeCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryImageCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryTitleCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategorySearchCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryCategoryCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryMoreGoodsCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryWaterCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryNormalCell class] IsXib:NO];
    [self.generalView registerCell:[CGXCollectionCategoryScrollerCell class] IsXib:NO];
    
    [self.generalView registerHeader:[CGXCollectionCategoryHeaderView class] IsXib:NO];
    [self.generalView registerHeader:[UICollectionReusableView class] IsXib:NO];
    [self.generalView registerFooter:[CGXCollectionCategoryFooterView class] IsXib:NO];
    
    [self.generalView registerFooter:[UICollectionReusableView class] IsXib:NO];
    self.generalView.isItemSpacingEequal = NO;
    self.generalView.isHaveSectionHeadetTap = YES;
    self.generalView.isHaveSectionFootetTap = YES;
    self.generalView.viewDelegate = self;
    
    
    //默认【下拉刷新】
    self.generalView.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.generalView loadData];
    }];
//    //默认【上拉加载】
//    self.generalView.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        [weakSelf.generalView loadMoreData];;
//    }];
    self.generalView.refresEndBlock = ^(NSInteger pageInter, NSInteger pageMax) {
        if (pageInter<pageMax) {
            weakSelf.generalView.collectionView.mj_footer.hidden = YES;
        }
        [weakSelf.generalView.collectionView.mj_footer endRefreshing];
        [weakSelf.generalView.collectionView.mj_header endRefreshing];
    };
    self.generalView.refresBlock = ^(BOOL isDownRefresh, NSInteger page) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf loadListIsDownRefresh:isDownRefresh Page:page];
        });
    };
    [self loadListIsDownRefresh:YES Page:1];
    
    
    //    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"刷1" style:UIBarButtonItemStyleDone target:self action:@selector(refr1)];
    //    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"刷2" style:UIBarButtonItemStyleDone target:self action:@selector(refr2)];
    //
    //    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"删1" style:UIBarButtonItemStyleDone target:self action:@selector(refr3)];
    //    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithTitle:@"删2" style:UIBarButtonItemStyleDone target:self action:@selector(refr4)];
    ////
    ////    self.navigationItem.leftBarButtonItems = @[item1,item2];
    //    self.navigationItem.rightBarButtonItems = @[item3,item4];
    //
    //     UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"查1" style:UIBarButtonItemStyleDone target:self action:@selector(inster1)];
    //     UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"查2" style:UIBarButtonItemStyleDone target:self action:@selector(inster2)];
    //
    //    self.navigationItem.leftBarButtonItems = @[item1,item2];
    
    
}
//- (void)refr1
//{
//    CGXCollectionCategoryGeneralSectionModel *sectionModel = [CGXGeneralViewTool replaceObjectAtSection:0];
//    [self.generalView replaceObjectAtSection:0 withObject:sectionModel];
//}
//- (void)refr2
//{
//    if (self.generalView.dataArray.count==0) {
//        return;
//    }
//    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:0];
//    if (sectionModel.rowArr.count==0) {
//        return;
//    }
//    CGXCollectionCategoryGeneralItemModel *item = [self.generalView pullSectionModel:sectionModel Row:0];
//    item.cellColor  =randomColor;
//    [self.generalView replaceObjectAtSection:0 RowIndex:0 withObject:item];
//
//}
//- (void)refr3
//{
//    [self.generalView deleteSections:0];
//}
//- (void)refr4
//{
//    [self.generalView deleteItemsAtSection:0 RowIndex:0];
//}

//- (void)inster1
//{
//    CGXCollectionCategoryGeneralSectionModel *sectionModel = [CGXGeneralViewTool insertObjectAtSection:0];
//    [self.generalView insertSections:0 withObject:sectionModel];
//}
//- (void)inster2
//{
//    if (self.generalView.dataArray.count==0) {
//        return;
//    }
//    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:0];
//    if (sectionModel.rowArr.count>0) {
//        CGXCollectionCategoryGeneralItemModel *rowModel = (CGXCollectionCategoryGeneralItemModel *)[sectionModel.rowArr firstObject];
//        rowModel.cellColor  = [UIColor redColor];
//        [self.generalView insertSections:0 RowIndex:sectionModel.rowArr.count+1 withObject:rowModel];
//    }
//}
//处理数据源
- (void)loadListIsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page
{
    NSMutableArray *dateAry = [NSMutableArray array];
    dateAry = [CGXGeneralViewTool loadDealWithList];
    [self.generalView updateDataArray:dateAry IsDownRefresh:isDownRefresh Page:page];
}
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(nonnull UICollectionViewCell *)cell DidSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:indexPath.section];
    CGXCollectionCategoryGeneralItemModel *itemModel  =  [self.generalView pullSectionModel:sectionModel Row:indexPath.row];
    NSLog(@"点击：%@--%@---%@",indexPath,itemModel,cell);
    
}
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(nonnull UICollectionViewCell *)cell cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:indexPath.section];
    CGXCollectionCategoryGeneralItemModel *itemModel  =  [self.generalView pullSectionModel:sectionModel Row:indexPath.row];
//    NSLog(@"处理显示数据：%@--%@----%@",cell,indexPath,itemModel.cellIdentifier);
    __weak typeof(self) weakSelf = self;
    if ([itemModel.cellIdentifier isEqualToString:@"CGXCollectionCategoryWaterCell"]) {
        CGXCollectionCategoryWaterCell *myCell = (CGXCollectionCategoryWaterCell *)cell;
        myCell.heightBlock = ^(CGFloat height) {
             NSLog(@"heightBlockheightBlockheightBlock----%f",height);
            itemModel.cellHeight = height;
            [weakSelf.generalView replaceObjectAtSection:indexPath.section RowIndex:indexPath.row withObject:itemModel];
        };
    }
}
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView AtIndexPath:(NSIndexPath *)indexPath SectionHeaderView:(UICollectionReusableView *)headerView
{
    NSLog(@"SectionHeaderView--%@",indexPath);
}
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView AtIndexPath:(NSIndexPath *)indexPath SectionFooterView:(UICollectionReusableView *)footerView
{
    NSLog(@"SectionFooterView--%@",indexPath);
}

- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView TapHeaderViewAtIndex:(NSInteger)section
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:section];
    NSLog(@"TapHeaderViewAtIndex--%ld--%@",(long)section,sectionModel.dataModel);
}
- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView TapFooterViewAtIndex:(NSInteger)section
{
    CGXCollectionCategoryGeneralSectionModel *sectionModel = [self.generalView pullSection:section];
    NSLog(@"TapFooterViewAtIndex--%ld--%@",(long)section,sectionModel.dataModel);
}
/*
 显示头分区
 */
//- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView ReferenceSizeForHeaderInSection:(NSInteger)section
//{
//    return 100;
//}
///*
// 显示脚分区
// */
//- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView ReferenceSizeForfooterInSection:(NSInteger)section
//{
//    return 60;
//}
//- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView MinimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}
//- (CGFloat)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView MinimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 60;
//}
//- (UIEdgeInsets)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(10, 10, 10, 10);
//}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
