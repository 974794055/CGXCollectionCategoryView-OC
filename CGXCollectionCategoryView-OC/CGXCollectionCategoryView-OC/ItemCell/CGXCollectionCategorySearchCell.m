//
//  CGXCollectionCategorySearchCell.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "CGXCollectionCategorySearchCell.h"
@interface CGXCollectionCategorySearchCell()<UISearchBarDelegate>

@property (nonatomic , strong) UISearchBar *searchBar;

@end
@implementation CGXCollectionCategorySearchCell
- (void)initializeViews
{
    [super initializeViews];
    self.searchBar = [[UISearchBar alloc] init];
    //设置背景图是为了去掉上下黑线
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    // 设置SearchBar的颜色主题为白色
    self.searchBar.translucent = YES;
    self.searchBar.barTintColor = [UIColor colorWithWhite:0.93 alpha:1];
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.layer.cornerRadius = 15.0f;
    self.searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
    self.searchBar.layer.borderWidth = 1;
    self.searchBar.layer.masksToBounds = YES;
    self.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.searchBar.showsCancelButton = NO;
    self.searchBar.barStyle = UIBarMetricsDefault;
    self.searchBar.tintColor = [UIColor blueColor];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索商品";
    self.searchBar.keyboardType = UIKeyboardTypeDefault;
    [self.contentView addSubview: self.searchBar];
    
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
    }];
    
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
//    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
//    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
//    [self.contentView addConstraint:top];
//    [self.contentView addConstraint:left];
//    [self.contentView addConstraint:right];
//    [self.contentView addConstraint:bottom];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    searchBar.text = @"";
    [searchBar resignFirstResponder];//释放第一响应者
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSString *strUrl = [searchText stringByReplacingOccurrencesOfString:@" " withString:@""];
    searchBar.text = strUrl;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
//    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
//    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.searchBar attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
//    [self.contentView addConstraint:top];
//    [self.contentView addConstraint:left];
//    [self.contentView addConstraint:right];
//    [self.contentView addConstraint:bottom];
    [self.searchBar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        make.top.equalTo(self.contentView.mas_top).offset(10);
    }];

}
- (void)updateWithCGXCollectionViewCellModel:(CGXCollectionCategoryBaseItemModel *)cellModel AtIndexPath:(NSIndexPath *)indexPath
{
    self.contentView.backgroundColor = cellModel.cellColor;
}
@end
