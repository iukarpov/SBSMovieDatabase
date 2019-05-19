//
//  MovieInfoCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 10/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieDetailInfoCell.h"


@implementation SBSMovieDetailInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureCell];
    }
    return self;
}

- (void)configureCell
{
    self.backgroundColor = UIColor.primaryColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupMoviePosterImageView];
    [self setupMovieTitleLabel];
    [self setupMovieReleaseDateLabel];
    [self setupMovieGenreLabel];
    [self setupMovieDurationLabel];
    [self setupMovieTaglineLabel];
    [self setupAddToFavouriteButton];
    [self setupConstraints];
}

- (void)setupMoviePosterImageView
{
    _moviePosterImageView = [UIImageView new];
    _moviePosterImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _moviePosterImageView.layer.cornerRadius = 10;
    _moviePosterImageView.clipsToBounds = YES;
    _moviePosterImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_moviePosterImageView];
}

- (void)setupMovieTitleLabel
{
    _movieTitleLabel = [UILabel new];
    _movieTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieTitleLabel.numberOfLines = 0;
    _movieTitleLabel.textColor = UIColor.primaryTextColor;
    [_movieTitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [_movieTitleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [self.contentView addSubview:_movieTitleLabel];
}

- (void)setupMovieReleaseDateLabel
{
    _movieReleaseDateLabel = [UILabel new];
    _movieReleaseDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieReleaseDateLabel.numberOfLines = 0;
    _movieReleaseDateLabel.textColor = UIColor.primaryTextColor;
    [_movieReleaseDateLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_movieReleaseDateLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieReleaseDateLabel];
}

- (void)setupMovieGenreLabel
{
    _movieGenreLabel = [UILabel new];
    _movieGenreLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieGenreLabel.numberOfLines = 0;
    _movieGenreLabel.textColor = UIColor.secondaryTextColor;
    [_movieGenreLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [_movieGenreLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieGenreLabel];
}

- (void)setupMovieDurationLabel
{
    _movieDurationLabel = [UILabel new];
    _movieDurationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieDurationLabel.numberOfLines = 0;
    _movieDurationLabel.textColor = UIColor.secondaryTextColor;
    [_movieDurationLabel setFont:[UIFont italicSystemFontOfSize:12]];
    [_movieDurationLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieDurationLabel];
}

- (void)setupMovieTaglineLabel
{
    _movieTaglineLabel = [UILabel new];
    _movieTaglineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieTaglineLabel.numberOfLines = 0;
    _movieTaglineLabel.textColor = UIColor.secondaryTextColor;
    [_movieTaglineLabel setFont:[UIFont italicSystemFontOfSize:12]];
    [_movieTaglineLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieTaglineLabel];
}

- (void)setupAddToFavouriteButton
{
    _addToFavouriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addToFavouriteButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_addToFavouriteButton setImage:[UIImage imageNamed:@"unselectedPin"] forState : UIControlStateNormal];
    [_addToFavouriteButton setImage:[UIImage imageNamed:@"selectedPin"] forState : UIControlStateSelected];
    [_addToFavouriteButton addTarget:self action:@selector(addToFavourite:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_addToFavouriteButton];
}

- (void)addToFavourite:(UIButton*)sender
{
        if (self.addToFavouriteButton.isSelected ==  YES)
        {
            [self.delegate didTapAddToFavouriteButton:YES];
            [sender setSelected: NO];
        }
        else
        {
            [sender setSelected: YES];
            [self.delegate didTapAddToFavouriteButton:NO];
        }
}

- (void)setupWithMovie:(SBSDetailMovie *)movie
{
    self.movieTitleLabel.text = movie.title;
    self.movieReleaseDateLabel.text = movie.releaseDate;
    self.movieGenreLabel.text = movie.genre;
    NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
    self.movieDurationLabel.text = [dateComponentsFormatter stringFromTimeInterval: movie.runtime];
    if (movie.tagline)
    {
    self.movieTaglineLabel.text = [NSString stringWithFormat:@"«‎%@»", movie.tagline];
    }
    if (movie.posterPath)
    {
        [self.moviePosterImageView loadImageFromURL:[SBSNetworkService createImageUrlForPath:movie.posterPath]];
    }
}

- (void)setupConstraints
{
    [self.moviePosterImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.moviePosterImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.moviePosterImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
    [self.moviePosterImageView.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor multiplier:0.3].active = YES;
    [self.moviePosterImageView.heightAnchor constraintEqualToConstant:160].active = YES;

    [self.moviePosterImageView setContentHuggingPriority:750 forAxis:UILayoutConstraintAxisVertical];
    [self.moviePosterImageView setContentCompressionResistancePriority:750 forAxis:UILayoutConstraintAxisVertical];

    [self.addToFavouriteButton.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.leadingAnchor].active = YES;
    [self.addToFavouriteButton.topAnchor constraintEqualToAnchor:self.moviePosterImageView.topAnchor].active = YES;
    [self.addToFavouriteButton.heightAnchor constraintEqualToConstant:30].active = YES;
    [self.addToFavouriteButton.widthAnchor constraintEqualToConstant:30].active = YES;
    
    [self.movieTitleLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:15].active = YES;
    [self.movieTitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieTitleLabel.topAnchor constraintEqualToAnchor:self.moviePosterImageView.topAnchor].active = YES;
    [self.movieTitleLabel.bottomAnchor constraintEqualToAnchor:self.movieReleaseDateLabel.topAnchor constant:0].active = YES;
    [self.movieTitleLabel setContentHuggingPriority:700 forAxis:UILayoutConstraintAxisVertical];
    [self.movieTitleLabel setContentCompressionResistancePriority:650 forAxis:UILayoutConstraintAxisVertical];

    [self.movieReleaseDateLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:15].active = YES;
    [self.movieReleaseDateLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieReleaseDateLabel.topAnchor constraintEqualToAnchor:self.movieTitleLabel.bottomAnchor constant:0].active = YES;
    [self.movieReleaseDateLabel setContentHuggingPriority:650 forAxis:UILayoutConstraintAxisVertical];
    [self.movieReleaseDateLabel setContentCompressionResistancePriority:600 forAxis:UILayoutConstraintAxisVertical];
    
    [self.movieGenreLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:15].active = YES;
    [self.movieGenreLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieGenreLabel.topAnchor constraintEqualToAnchor:self.movieReleaseDateLabel.bottomAnchor constant:25].active = YES;
    [self.movieGenreLabel setContentHuggingPriority:600 forAxis:UILayoutConstraintAxisVertical];
    [self.movieGenreLabel setContentCompressionResistancePriority:550 forAxis:UILayoutConstraintAxisVertical];

    [self.movieDurationLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:15].active = YES;
    [self.movieDurationLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieDurationLabel.topAnchor constraintEqualToAnchor:self.movieGenreLabel.bottomAnchor].active = YES;
    [self.movieDurationLabel setContentHuggingPriority:570 forAxis:UILayoutConstraintAxisVertical];
    [self.movieDurationLabel setContentCompressionResistancePriority:500 forAxis:UILayoutConstraintAxisVertical];
    
    [self.movieTaglineLabel.leadingAnchor constraintEqualToAnchor:self.moviePosterImageView.trailingAnchor constant:15].active = YES;
    [self.movieTaglineLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.movieTaglineLabel.topAnchor constraintEqualToAnchor:self.movieDurationLabel.bottomAnchor constant:20].active = YES;
    [self.movieTaglineLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
    [self.movieTaglineLabel setContentHuggingPriority:560 forAxis:UILayoutConstraintAxisVertical];
    [self.movieTaglineLabel setContentCompressionResistancePriority:500 forAxis:UILayoutConstraintAxisVertical];
}


@end
