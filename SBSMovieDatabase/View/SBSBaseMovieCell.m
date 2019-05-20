//
//  SBSFavouriteMovieCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 14/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSBaseMovieCell.h"


@implementation SBSBaseMovieCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self configureCell];
        [self setupConstraints];
    }
    return self;
}

- (void)configureCell
{
    self.backgroundColor = UIColor.sbsBackgroundPrimaryColor;
    [self setupMoviePosterImageView];
    [self setupMovieTitleLabel];
    [self setupMovieReleaseDateLabel];
    [self setupMovieGenreLabel];
    [self setupMovieRatingLabel];
    [self setupMovieDurationLabel];
}

- (void)setupMoviePosterImageView
{
    _moviePosterImageView = [UIImageView new];
    _moviePosterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _moviePosterImageView.layer.cornerRadius = 10;
    _moviePosterImageView.clipsToBounds = YES;
    _moviePosterImageView.contentMode = UIViewContentModeScaleAspectFill;
    _moviePosterImageView.backgroundColor = UIColor.redColor;
    
    [self.contentView addSubview:_moviePosterImageView];
}

- (void)setupMovieTitleLabel
{
    _movieTitleLabel = [UILabel new];
    _movieTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieTitleLabel.numberOfLines = 0;
    _movieTitleLabel.textColor = UIColor.sbsPrimaryTextColor;
    [_movieReleaseDateLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [_movieTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.contentView addSubview:_movieTitleLabel];
}

- (void)setupMovieReleaseDateLabel
{
    _movieReleaseDateLabel = [UILabel new];
    _movieReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieReleaseDateLabel.numberOfLines = 0;
    _movieReleaseDateLabel.textColor = UIColor.sbsPrimaryTextColor;
    [_movieReleaseDateLabel setFont:[UIFont systemFontOfSize:12]];
    [_movieReleaseDateLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieReleaseDateLabel];
}

- (void)setupMovieGenreLabel
{
    _movieGenreLabel = [UILabel new];
    _movieGenreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieGenreLabel.numberOfLines = 0;
    _movieGenreLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieGenreLabel setFont:[UIFont systemFontOfSize:12]];
    [_movieGenreLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieGenreLabel];
}

- (void)setupMovieDurationLabel
{
    _movieDurationLabel = [UILabel new];
    _movieDurationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieDurationLabel.numberOfLines = 0;
    _movieDurationLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieDurationLabel setFont:[UIFont systemFontOfSize:12]];
    [_movieDurationLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieDurationLabel];
}

- (void)setupMovieRatingLabel
{
    _movieRatingLabel = [UILabel new];
    _movieRatingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieRatingLabel.numberOfLines = 0;
    _movieRatingLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieRatingLabel setFont:[UIFont systemFontOfSize:12]];
    [_movieRatingLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieRatingLabel];
}

- (NSString *)stringFromTimeInterval:(NSTimeInterval)interval
{
    NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
    return  [dateComponentsFormatter stringFromTimeInterval:interval];
}

- (void)setupConstraints
{
    [self.moviePosterImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.moviePosterImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.moviePosterImageView.heightAnchor constraintEqualToConstant:120].active = YES;
    [self.moviePosterImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
    [self.moviePosterImageView.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor multiplier:.25].active = YES;
    
    [self.movieTitleLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:10].active = YES;
    [self.movieTitleLabel.topAnchor constraintEqualToAnchor:self.moviePosterImageView.topAnchor].active = YES;
    [self.movieTitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    [self.movieTitleLabel setContentHuggingPriority:700 forAxis:UILayoutConstraintAxisVertical];
    [self.movieTitleLabel setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisVertical];
    
    
    [self.movieReleaseDateLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:10].active = YES;
    [self.movieReleaseDateLabel.topAnchor constraintEqualToAnchor:self.movieTitleLabel.bottomAnchor].active = YES;
    [self.movieReleaseDateLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieReleaseDateLabel setContentHuggingPriority:650 forAxis:UILayoutConstraintAxisVertical];
    [self.movieReleaseDateLabel setContentCompressionResistancePriority:690 forAxis:UILayoutConstraintAxisVertical];

    [self.movieGenreLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:10].active = YES;
    [self.movieGenreLabel.topAnchor constraintEqualToAnchor:self.movieReleaseDateLabel.bottomAnchor constant:15].active = YES;
    [self.movieGenreLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieGenreLabel setContentHuggingPriority:600 forAxis:UILayoutConstraintAxisVertical];
    [self.movieGenreLabel setContentCompressionResistancePriority:625 forAxis:UILayoutConstraintAxisVertical];


    [self.movieRatingLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:10].active = YES;
    [self.movieRatingLabel.topAnchor constraintEqualToAnchor:self.movieGenreLabel.bottomAnchor constant:15].active = YES;
    [self.movieRatingLabel.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.movieRatingLabel setContentHuggingPriority:600 forAxis:UILayoutConstraintAxisVertical];
    [self.movieRatingLabel setContentCompressionResistancePriority:600 forAxis:UILayoutConstraintAxisVertical];


    [self.movieDurationLabel.topAnchor constraintEqualToAnchor:self.movieGenreLabel.bottomAnchor constant:15].active = YES;
    [self.movieDurationLabel.bottomAnchor constraintEqualToAnchor:self.moviePosterImageView.bottomAnchor].active = YES;
    [self.movieDurationLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieDurationLabel setContentHuggingPriority:650 forAxis:UILayoutConstraintAxisVertical];
    [self.movieDurationLabel setContentCompressionResistancePriority:610 forAxis:UILayoutConstraintAxisVertical];

}
@end
