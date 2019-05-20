//
//  UIColor+SBSCustomColors.m
//  SBSMovieDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "UIColor+SBSCustomColors.h"


@implementation UIColor(SBSCustomColors)

+ (UIColor *)sbsBackgroundPrimaryColor
{
    return [UIColor colorWithRed:31/255.0 green:30/255.0 blue:30/255.0 alpha:1.0];
}

+ (UIColor *)sbsBackgroundSecondaryColor
{
    return [UIColor colorWithRed:52/255.0 green:54/255.0 blue:60/255.0 alpha:1.0];
}

+ (UIColor *)sbsPrimaryTextColor
{
    return [UIColor whiteColor];
}

+ (UIColor *)sbsSecondaryTextColor
{
    return [UIColor lightGrayColor];
}

+ (UIColor *)sbsNavigationBarTintColor
{
    return [UIColor colorWithRed:72/255.0 green:74/255.0 blue:81/255.0 alpha:1.0];
}

@end
