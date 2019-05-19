//
//  MovieDetailOverviewCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 10/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieDetailOverviewCell.h"


@implementation SBSMovieDetailOverviewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self setupMovieOverviewLabel];
    [self setupConstraints];
}
- (void)setupMovieOverviewLabel
{
    _movieOverviewLabel = [UILabel new];
    _movieOverviewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieOverviewLabel.numberOfLines = 3;
    _movieOverviewLabel.textColor = UIColor.primaryTextColor;
    [_movieOverviewLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_movieOverviewLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.contentView addSubview:_movieOverviewLabel];
}

- (void)setupWithMovie:(SBSDetailMovie *)movie
{
    self.movieOverviewLabel.text = movie.overview;
}

- (void)setupConstraints
{
    [self.movieOverviewLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:20].active = YES;
    [self.movieOverviewLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.movieOverviewLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.movieOverviewLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
}
@end
