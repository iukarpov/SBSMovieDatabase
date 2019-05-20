//
//  SBSMovieCollectionViewCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieCollectionViewCell.h"
#import "UIImageView+SBSNetwork.h"
#import "SBSNetworkService.h"
#import "UIColor+SBSCustomColors.h"


@implementation SBSMovieCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configureCell];
    }
    return self;
}

- (void)configureCell
{
    [self setupMoviePosterImageView];
    [self setupMovieTitleLabel];
    [self setupConstraints];
}

- (void)setupMovieTitleLabel
{
    _movieTitleLabel = [UILabel new];
    _movieTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieTitleLabel.numberOfLines = 0;
    _movieTitleLabel.textColor = UIColor.sbsPrimaryTextColor;
    [_movieTitleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_movieTitleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    _movieTitleLabel.adjustsFontSizeToFitWidth = NO;
    [self addSubview:_movieTitleLabel];
}

- (void)setupMoviePosterImageView
{
    _moviePosterImageView = [UIImageView new];
    _moviePosterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _moviePosterImageView.layer.cornerRadius = 10;
    _moviePosterImageView.clipsToBounds = YES;
    _moviePosterImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_moviePosterImageView];
}

- (void)setupWithMovie:(SBSDetailMovie *)movie
{
    self.movieTitleLabel.text = movie.title;
    self.movieID = movie.movieID;
    [self.moviePosterImageView sbsLoadImageFromURL:[SBSNetworkService createImageUrlForPath:movie.posterPath]];

}

- (void)setupConstraints
{
    [self.moviePosterImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.moviePosterImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.moviePosterImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.moviePosterImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-40.0].active = YES;

    [self.movieTitleLabel.topAnchor constraintEqualToAnchor:self.moviePosterImageView.bottomAnchor constant:5].active = YES;
    [self.movieTitleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
    [self.movieTitleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.movieTitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    
}
@end
