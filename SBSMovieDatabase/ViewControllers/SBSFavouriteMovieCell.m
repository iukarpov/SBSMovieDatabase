//
//  SBSFavouriteMovieCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import "SBSFavouriteMovieCell.h"

@implementation SBSFavouriteMovieCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {

    }
    return self;
}

- (void)setupWithFavouriteMovie:(FavouriteMovie *)movie
{
    self.movieTitleLabel.text = movie.title;
    self.movieReleaseDateLabel.text = movie.releaseDate;
    self.movieGenreLabel.text = movie.genre;
    self.movieRatingLabel.text = [NSString stringWithFormat:@"%.01f", movie.voteAverage];
    self.movieDurationLabel.text = [self stringFromTimeInterval:movie.duration];
    self.moviePosterImageView.image = [UIImage imageWithData:movie.poster];
}

@end
