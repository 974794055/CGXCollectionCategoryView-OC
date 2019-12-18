//
//  CGXCollectionCategoryBaseView.h
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CGXCollectionCategoryBaseSectionModel.h"
#import "UIView+CGXCollectionCategoryViewTap.h"

#import "CGXCollectionCategoryUpdateViewDelegate.h"
#import "CGXCollectionCategoryUpdateCellDelegate.h"
#import "CGXCollectionCategoryUpdateHeaderDelegate.h"
#import "CGXCollectionCategoryUpdateFooterDelegate.h"

NS_ASSUME_NONNULL_BEGIN
/*
  刷 新。
 */
typedef void (^CGXCollectionCategoryBaseViewRefresBlock)(BOOL isDownRefresh,NSInteger page);
/*
 刷 新 更新界面 停止刷新
 pageInter :每页数量
 pageMax:每页最大数量
 */
typedef void (^CGXCollectionCategoryBaseViewRefresEndBlock)(NSInteger pageInter,NSInteger pageMax);

/*
 自适应返回的高度
 */
typedef void (^CGXCollectionCategoryBaseViewHeightBlock)(CGXCollectionCategoryBaseView *generalView,CGFloat height);

@interface CGXCollectionCategoryBaseView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

- (void)initializeData NS_REQUIRES_SUPER;
- (void)initializeViews NS_REQUIRES_SUPER;

@property (nonatomic , strong) UICollectionView *collectionView;

@property (nonatomic,assign) BOOL isAdaptive;
/*
 自适应时高度
 */
@property(nonatomic,copy) CGXCollectionCategoryBaseViewHeightBlock heightBlock;

@property (nonatomic , weak) id<CGXCollectionCategoryUpdateViewDelegate>viewDelegate;

@property (nonatomic , copy) CGXCollectionCategoryBaseViewRefresBlock refresBlock;

@property (nonatomic , copy) CGXCollectionCategoryBaseViewRefresEndBlock refresEndBlock;

/*
 //每个分区的间距是否一致 默认YES 以下三项有效   model里面的设置无效
 */
@property (nonatomic , assign) BOOL isItemSpacingEequal;
@property (nonatomic , assign) NSInteger minimumLineSpacing;//默认是10
@property (nonatomic , assign) NSInteger minimumInteritemSpacing;//默认是10
@property (nonatomic) UIEdgeInsets insets;//默认是10

@property (nonatomic , assign) BOOL showsHorizontalScrollIndicator;
@property (nonatomic , assign) BOOL showsVerticalScrollIndicator;

/*
 是否有头分区tap点击  默认没有 NO
 */
@property (nonatomic , assign) BOOL isHaveSectionHeadetTap;
/*
 是否有脚分区tap点击  默认没有 NO
 */
@property (nonatomic , assign) BOOL isHaveSectionFootetTap;

//是否自定义刷新控件。默认 NO ，为YES时需要外界写

@property (nonatomic , assign) BOOL isRefreshUI;
/*
 加载数据 下拉调用
 */
- (void)loadData;
/*
 加载更多数据 上拉调用
 */
- (void)loadMoreData;
/*
 重写layout
 */
- (UICollectionViewLayout *)preferredFlowLayout NS_REQUIRES_SUPER;

/*
 自定义cell 必须实现
 */
- (void)registerCell:(Class)classCell IsXib:(BOOL)isXib;
- (void)registerFooter:(Class)footer IsXib:(BOOL)isXib;
- (void)registerHeader:(Class)header IsXib:(BOOL)isXib;

/*
 dataArray：数据源  外界读取使用，更新数据源请使用  updateDataArray:
 */
@property (nonatomic , strong,readonly) NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *dataArray;//数据源数组
/*
 array：数据源
 pageCount:每次加载的个数
 pageSize：每页个数。默认10个
 */
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page NS_REQUIRES_SUPER;
/*
 array：数据源
 page:页数
 maxPage:每页返回最大值 默认20
 */
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page MaxPage:(NSInteger)maxPage NS_REQUIRES_SUPER;
//删除一个分区
- (void)deleteSections:(NSInteger)section;
//删除单行
- (void)deleteItemsAtSection:(NSInteger)section RowIndex:(NSInteger)row;
/*
 收起键盘
 */
- (void)hidekeyboard;
@end

NS_ASSUME_NONNULL_END
