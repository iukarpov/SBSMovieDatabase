//
//  MovieDetailOverviewCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 10/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIColor+SBSCustomColors.h"
#import "SetupMovieProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieDetailOverviewCell : UITableViewCell <SetupMovieProtocol>

@property (nonatomic, strong) UILabel *movieOverviewLabel;
@end

NS_ASSUME_NONNULL_END
