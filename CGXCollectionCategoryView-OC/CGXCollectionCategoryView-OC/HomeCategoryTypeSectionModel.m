//
//  HomeCategoryTypeSectionModel.m
//  CGXCollectionCategoryView-OC
//
//  Created by CGX on 2019/05/01.
//  Copyright © 2019 CGX. All rights reserved.
//

#import "HomeCategoryTypeSectionModel.h"

@implementation HomeCategoryTypeSectionModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"HomeCategoryTypeItemModel",
             @"goods":@"HomeCategoryTypeSectionModel"
             };
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             
             };
}
@end
