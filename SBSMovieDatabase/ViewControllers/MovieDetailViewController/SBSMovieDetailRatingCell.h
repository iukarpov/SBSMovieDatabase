//
//  SBSMovieRatingCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 11/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SetupMovieProtocol.h"
#import "UIColor+SBSCustomColors.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieDetailRatingCell : UITableViewCell <SetupMovieProtocol>

@property (nonatomic, strong) UILabel *movieRatingLabel;
@property (nonatomic, strong) UILabel *movieVotesLabel;
@property (nonatomic, strong) UILabel *movieBudgetLabel;
@property (nonatomic, strong) UILabel *movieRevenueLabel;
@property (nonatomic, strong) UIImageView *starImage;
@property (nonatomic, strong) UIStackView *stackView;
@end

NS_ASSUME_NONNULL_END
