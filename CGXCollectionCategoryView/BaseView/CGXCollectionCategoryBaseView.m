//
//  CGXCollectionCategoryBaseView.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategoryBaseView.h"
#import <objc/runtime.h>
@interface CGXCollectionCategoryBaseView()
@property (nonatomic , strong,readwrite) NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *dataArray;//数据源数组

@property (nonatomic , assign) BOOL isDownRefresh;
@property (nonatomic , assign) NSInteger page;
@property (nonatomic , assign) BOOL isHaveNo;//是否有空

@end

@implementation CGXCollectionCategoryBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeData];
        [self initializeViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initializeData];
        [self initializeViews];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    if (self.isAdaptive) {
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
        [layout invalidateLayout];
        self.collectionView.frame = self.bounds;
        if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) {
            [self invalidateIntrinsicContentSize];
        }
        CGFloat height = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
        if (height != 0 && height != self.bounds.size.height) {
            CGRect frame = self.frame;
            frame.size.height = height;
            self.frame = frame;
            self.collectionView.frame = self.bounds;
            __weak typeof(self) weakSlef = self;
            if (self.heightBlock) {
                self.heightBlock(weakSlef,height);
            }
            if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:WithViewHeight:)]) {
                [self.viewDelegate collectionViewCGXBaseView:self WithViewHeight:height];
            }
        }
    }
    [self.collectionView reloadData];
}
- (CGSize)intrinsicContentSize
{
    return self.collectionView.collectionViewLayout.collectionViewContentSize;
}

- (void)initializeData
{
    _dataArray = [NSMutableArray array];
    self.insets =UIEdgeInsetsMake(10, 10, 10, 10);
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 10;
    self.isItemSpacingEequal = YES;
    self.isHaveSectionFootetTap = NO;
    self.isHaveSectionHeadetTap = NO;
     self.showsHorizontalScrollIndicator = YES;
     self.showsHorizontalScrollIndicator = YES;
    self.isDownRefresh = YES;
    self.page = 1;
    self.isHaveNo = NO;
    self.isRefreshUI = NO;
}

- (void)initializeViews
{
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)) collectionViewLayout:[self preferredFlowLayout]];
    self.collectionView.backgroundColor = self.backgroundColor;
    self.collectionView.showsHorizontalScrollIndicator = self.showsHorizontalScrollIndicator;
    self.collectionView.showsVerticalScrollIndicator = self.showsHorizontalScrollIndicator;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.alwaysBounceVertical = YES;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
//    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //给collectionView注册头分区的Id
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    //给collection注册脚分区的id
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class])];
    [self addSubview:self.collectionView];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self addSubview:self.collectionView];
    
    // 监听滚动
    [self.collectionView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
}
- (void)loadData
{
    self.isDownRefresh = YES;
    self.page = 1;
    if (self.refresBlock) {
        self.refresBlock(self.isDownRefresh, self.page);
    }
}
- (void)loadMoreData
{
    self.isDownRefresh = NO;
    self.page++;
    if (self.refresBlock) {
        self.refresBlock(self.isDownRefresh, self.page);
    }
}
#pragma mark - <UICollectionViewDataSource, UICollectionViewDelegate>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CGXCollectionCategoryBaseSectionModel *sectionModel = self.dataArray[section];
    return sectionModel.rowArr.count;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionCategoryBaseSectionModel *sectionModel = self.dataArray[indexPath.section];
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionModel.headerModel.headerIdentifier forIndexPath:indexPath];
        if(view == nil) {
            view = [[NSClassFromString(sectionModel.headerModel.headerIdentifier) alloc] init];
        }
        [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        UICollectionReusableView *headerview = (UICollectionReusableView *)[self createForClass:sectionModel.headerModel.headerIdentifier];
        headerview.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        headerview.backgroundColor = sectionModel.headerModel.headerBgColor;
        headerview.tag = sectionModel.headerModel.headerTag;
        BOOL isHave = [headerview respondsToSelector:@selector(updateWithCGXCollectionViewHeaderViewModel:InSection:)];
        if (isHave == YES && [headerview conformsToProtocol:@protocol(CGXCollectionCategoryUpdateHeaderDelegate)]) {
            [(UICollectionReusableView<CGXCollectionCategoryUpdateHeaderDelegate> *)headerview updateWithCGXCollectionViewHeaderViewModel:sectionModel  InSection:indexPath.section];
        }
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:AtIndexPath:SectionHeaderView:)]) {
            [self.viewDelegate collectionViewCGXBaseView:self AtIndexPath:indexPath SectionHeaderView:headerview];
        }
        if (self.isHaveSectionHeadetTap) {
            __weak typeof(self) headerviewSelf = self;
            [headerview addTapGestureRecognizerWithDelegate:self Block:^(NSInteger tag) {
                if (headerviewSelf.viewDelegate && [headerviewSelf.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:TapHeaderViewAtIndex:)]) {
                    [headerviewSelf.viewDelegate collectionViewCGXBaseView:headerviewSelf TapHeaderViewAtIndex:indexPath.section];
                }
            }];
        }
        [view addSubview:headerview];
        return view;
    } else {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:sectionModel.footerModel.footerIdentifier forIndexPath:indexPath];
        if(view == nil) {
            view = [[NSClassFromString(sectionModel.footerModel.footerIdentifier) alloc] init];
        }
        [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj removeFromSuperview];
        }];
        UICollectionReusableView *footerview = (UICollectionReusableView *)[self createForClass:sectionModel.footerModel.footerIdentifier];
        footerview.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        footerview.backgroundColor = sectionModel.footerModel.footerBgColor;
        footerview.tag = sectionModel.footerModel.footerTag;
        BOOL isHave = [footerview respondsToSelector:@selector(updateWithCGXCollectionViewFooterViewModel:InSection:)];
        if (isHave == YES && [footerview conformsToProtocol:@protocol(CGXCollectionCategoryUpdateFooterDelegate)]) {
            [(UICollectionReusableView<CGXCollectionCategoryUpdateFooterDelegate> *)footerview updateWithCGXCollectionViewFooterViewModel:sectionModel  InSection:indexPath.section];
        }
        if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:AtIndexPath:SectionFooterView:)]) {
            [self.viewDelegate collectionViewCGXBaseView:self AtIndexPath:indexPath SectionFooterView:footerview];
        }
        if (self.isHaveSectionFootetTap) {
            __weak typeof(self) footerviewSelf = self;
            [footerview addTapGestureRecognizerWithDelegate:self Block:^(NSInteger tag) {
                if (footerviewSelf.viewDelegate && [footerviewSelf.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:TapFooterViewAtIndex:)]) {
                    [footerviewSelf.viewDelegate collectionViewCGXBaseView:footerviewSelf TapFooterViewAtIndex:indexPath.section];
                }
            }];
        }
        [view addSubview:footerview];
        return view;
    }
}
- (id)createForClass:(NSString *)name
{
    const char *className = [name cStringUsingEncoding:NSASCIIStringEncoding];
    // 从一个字串返回一个类
    Class newClass = objc_getClass(className);
    if (!newClass)
    {
        // 创建一个类
        Class superClass = [NSObject class];
        newClass = objc_allocateClassPair(superClass, className, 0);
        // 注册你创建的这个类
        objc_registerClassPair(newClass);
    }
    // 创建对象
    id instance = [[newClass alloc] init];
    
    return instance;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXCollectionCategoryBaseSectionModel *sectionModel = self.dataArray[indexPath.section];
    CGXCollectionCategoryBaseItemModel *item = sectionModel.rowArr[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:item.cellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = item.cellColor;
    BOOL isHave = [cell respondsToSelector:@selector(updateWithCGXCollectionViewCellModel:AtIndexPath:)];
    if (isHave == YES && [cell conformsToProtocol:@protocol(CGXCollectionCategoryUpdateCellDelegate)]) {
        [(UICollectionViewCell<CGXCollectionCategoryUpdateCellDelegate> *)cell updateWithCGXCollectionViewCellModel:item  AtIndexPath:indexPath];
    }
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:Cell:cellForItemAtIndexPath:)]) {
        [self.viewDelegate collectionViewCGXBaseView:self Cell:cell cellForItemAtIndexPath:indexPath];
    };
    return cell;
    
}
#pragma mark - cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:Cell:DidSelectItemAtIndexPath:)]) {
        [self.viewDelegate collectionViewCGXBaseView:self Cell:cell DidSelectItemAtIndexPath:indexPath];
    };
}
/*
 array：数据源
 pageCount:每次加载的个数
 pageSize：每页个数。默认10个
 */
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page
{
    [self updateDataArray:array IsDownRefresh:isDownRefresh Page:page MaxPage:10];
}
- (void)updateDataArray:(NSMutableArray<CGXCollectionCategoryBaseSectionModel *> *)array IsDownRefresh:(BOOL)isDownRefresh Page:(NSInteger)page MaxPage:(NSInteger)maxPage
{
    self.isHaveNo = YES;
    if (isDownRefresh) {
        [self.dataArray removeAllObjects];
    }
    self.isDownRefresh = isDownRefresh;
    self.page = page;
    for (CGXCollectionCategoryBaseSectionModel *sectionModel in array) {
        [self.dataArray addObject:sectionModel];
    }
    [self.collectionView reloadData];
    if (self.refresEndBlock) {
        self.refresEndBlock(array.count, maxPage);
    }
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


- (UICollectionViewLayout *)preferredFlowLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}

- (Class)preferredCellClass {
    return UICollectionViewCell.class;
}

- (void)registerCell:(Class)classCell IsXib:(BOOL)isXib
{
    if (![classCell isKindOfClass:[UICollectionViewCell class]]) {
        NSAssert(![classCell isKindOfClass:[UICollectionViewCell class]], @"注册cell的registerCellAry数组必须是UICollectionViewCell类型");
    }
    if (isXib) {
        [self.collectionView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"%@", classCell] bundle:nil] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@", classCell]];
        
    } else{
        [self.collectionView registerClass:classCell forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@", classCell]];
    }
}
- (void)registerFooter:(Class)footer IsXib:(BOOL)isXib
{
    if (![footer isKindOfClass:[UICollectionReusableView class]]) {
        NSAssert(![footer isKindOfClass:[UICollectionReusableView class]], @"注册cell的registerCellAry数组必须是UICollectionReusableView类型");
    }
    if (isXib) {
        [self.collectionView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"%@", footer] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@", footer]];
    } else{
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[NSString stringWithFormat:@"%@", footer]];
    }
}
- (void)registerHeader:(Class)header IsXib:(BOOL)isXib
{
    if (![header isKindOfClass:[UICollectionReusableView class]]) {
        NSAssert(![header isKindOfClass:[UICollectionReusableView class]], @"注册cell的registerCellAry数组必须是UICollectionReusableView类型");
    }
    if (isXib) {
        [self.collectionView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"%@", header] bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@", header]];
    } else{
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"%@", header]];
    }
}

////删除一个分区
- (void)deleteSections:(NSInteger)section
{
    if (self.dataArray.count==0) {
        return;
    }
    if (section>self.dataArray.count-1) {
        return;
    }
    CGXCollectionCategoryBaseSectionModel *itemModel  = self.dataArray[section];

    __weak typeof(self) viewSelf = self;
    [UIView performWithoutAnimation:^{
        [viewSelf.dataArray removeObject:itemModel];
        [viewSelf.collectionView deleteSections:[NSIndexSet indexSetWithIndex:section]];
    }];

}
//删除单行
- (void)deleteItemsAtSection:(NSInteger)section RowIndex:(NSInteger)row
{
    if (self.dataArray.count==0) {
        return;
    }
    if (section>self.dataArray.count-1) {
        return;
    }
    NSIndexPath *indexPathNew = [NSIndexPath indexPathForRow:row inSection:section];
    CGXCollectionCategoryBaseSectionModel *sectionModel  = self.dataArray[indexPathNew.section];
    if (sectionModel.rowArr.count==0) {
        return;
    }
    if (row>sectionModel.rowArr.count-1) {
        return;
    }
    CGXCollectionCategoryBaseItemModel *itemModel  = sectionModel.rowArr[row];
    __weak typeof(self) viewSelf = self;
    [UIView performWithoutAnimation:^{
        [sectionModel.rowArr removeObject:itemModel];
        [viewSelf.dataArray replaceObjectAtIndex:indexPathNew.section withObject:sectionModel];
        [viewSelf.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObjects:indexPathNew, nil]];
    }];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:scrollViewDidScroll:)]) {
        [self.viewDelegate collectionViewCGXBaseView:self scrollViewDidScroll:scrollView];
    }
}
#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"contentOffset"]) {
        CGPoint contentOffset = [change[NSKeyValueChangeNewKey] CGPointValue];
        if ((self.collectionView.isTracking || self.collectionView.isDecelerating)) {
            //只处理用户滚动的情况
            if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(collectionViewCGXBaseView:DropUpDownDidChanged:)]) {
                [self.viewDelegate collectionViewCGXBaseView:self DropUpDownDidChanged:contentOffset];
            }
        }
    }
}
- (void)hidekeyboard
{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
