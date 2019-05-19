//
//  MovieInfoCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 10/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+SBSCustomColors.h"
#import "SBSDetailMovie.h"
#import "UIImageView+SBSNetwork.h"
#import "SBSNetworkService.h"
#import "AppDelegate.h"


NS_ASSUME_NONNULL_BEGIN


@protocol SBSMovieDetailInfoCellDelegate <NSObject>

- (void)didTapAddToFavouriteButton:(BOOL)isSelected;
@end


@interface SBSMovieDetailInfoCell : UITableViewCell
@property (nonatomic, strong) UIImageView *moviePosterImageView;
@property (nonatomic, strong) UILabel *movieTitleLabel;
@property (nonatomic, strong) UILabel *movieReleaseDateLabel;
@property (nonatomic, strong) UILabel *movieGenreLabel;
@property (nonatomic, strong) UILabel *movieDurationLabel;
@property (nonatomic, strong) UILabel *movieTaglineLabel;
@property (nonatomic, strong) UIButton *addToFavouriteButton;
@property (nonatomic, weak) id <SBSMovieDetailInfoCellDelegate> delegate;

- (void)setupWithMovie:(SBSDetailMovie *)movie;
@end

NS_ASSUME_NONNULL_END
