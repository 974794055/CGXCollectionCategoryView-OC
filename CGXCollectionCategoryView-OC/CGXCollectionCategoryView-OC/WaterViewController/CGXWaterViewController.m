//
//  WaterViewController.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXWaterViewController.h"
#import "CGXCollectionCategoryWaterView.h"
#import "CGXCollectionCategoryTitleCell.h"
#import "CGXWaterViewTool.h"
@interface CGXWaterViewController ()<CGXCollectionCategoryUpdateViewDelegate>
@property (nonatomic , strong) CGXCollectionCategoryWaterView *generalView;
@end

@implementation CGXWaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"流水";
    self.generalView = [[CGXCollectionCategoryWaterView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-([[UIApplication sharedApplication] statusBarFrame].size.height+44)-([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49))];
    self.generalView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
    [self.view addSubview:self.generalView];
    self.generalView.viewDelegate = self;
    [self.generalView registerCell:[CGXCollectionCategoryTitleCell class] IsXib:NO];
    [self.generalView registerHeader:[UICollectionReusableView class] IsXib:NO];
    [self.generalView registerHeader:[UICollectionReusableView class] IsXib:NO];
    [self.generalView registerFooter:[UICollectionReusableView class] IsXib:NO];
    [self loadListIsDownRefresh:YES Page:1];
    
}
//处理数据源
- (void)loadListIsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page
{
    NSMutableArray *dateAry = [CGXWaterViewTool loadDealWithList];
    [self.generalView updateDataArray:dateAry IsDownRefresh:isDownRefresh Page:page];
}

- (void)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView Cell:(nonnull UICollectionViewCell *)cell DidSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSLog(@"点击：%@--%@-",baseView.dataArray,indexPath);
}
- (CGSize)collectionViewCGXBaseView:(CGXCollectionCategoryBaseView *)baseView sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
