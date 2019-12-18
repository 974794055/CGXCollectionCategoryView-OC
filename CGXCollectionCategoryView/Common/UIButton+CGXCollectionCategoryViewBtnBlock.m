//
//  UIButton+CGXTableViewGeneralBtnBlock.m
//  CGXCollectionViewCategoryView
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "UIButton+CGXCollectionCategoryViewBtnBlock.h"
#import <objc/runtime.h>

@implementation UIButton (CGXCollectionCategoryBtnBlock)

-(void)setBlock:(void(^)(UIButton*))block{
    objc_setAssociatedObject(self,@selector(block), block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
}
-(void(^)(UIButton*))block{
    return objc_getAssociatedObject(self,@selector(block));
    
}
-(void)addGXTapBlock:(void(^)(UIButton*))block{
    self.block= block;
    [self addTarget:self action:@selector(click:)forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)click:(UIButton*)btn{
    if(self.block){
        self.block(btn);
    }
}



@end
