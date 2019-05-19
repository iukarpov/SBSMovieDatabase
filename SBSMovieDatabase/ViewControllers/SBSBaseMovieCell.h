//
//  SBSFavouriteMovieCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 14/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "UIColor+SBSCustomColors.h"
#import "FavouriteMovie+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSBaseMovieCell : UITableViewCell

@property (nonatomic, strong) UIImageView *moviePosterImageView;
@property (nonatomic, strong) UILabel *movieTitleLabel;
@property (nonatomic, strong) UILabel *movieReleaseDateLabel;
@property (nonatomic, strong) UILabel *movieGenreLabel;
@property (nonatomic, strong) UILabel *movieDurationLabel;
@property (nonatomic, strong) UILabel *movieRatingLabel;

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval;
@end

NS_ASSUME_NONNULL_END
