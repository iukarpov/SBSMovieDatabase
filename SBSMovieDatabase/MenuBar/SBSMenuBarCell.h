//
//  SBSMenuBarCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 25/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIColor+SBSCustomColors.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMenuBarCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *menuBarImageView;
@property (nonatomic, strong) UILabel *menuBarTitle;
@end

NS_ASSUME_NONNULL_END
