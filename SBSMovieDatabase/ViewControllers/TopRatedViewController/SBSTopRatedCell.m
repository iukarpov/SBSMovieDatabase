//
//  SBSTopRatedCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import "SBSTopRatedCell.h"

@implementation SBSTopRatedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}

- (void)setupWithMovie:(SBSMovie *)movie
{
    self.movieTitleLabel.text = movie.title;
    [self.moviePosterImageView loadImageFromURL:[SBSNetworkService createImageUrlForPath:movie.posterPath]];

}

@end
