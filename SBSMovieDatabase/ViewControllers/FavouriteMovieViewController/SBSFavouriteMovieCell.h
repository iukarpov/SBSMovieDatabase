//
//  SBSFavouriteMovieCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import "SBSBaseMovieCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBSFavouriteMovieCell : SBSBaseMovieCell

- (void)setupWithFavouriteMovie:(FavouriteMovie *)movie;
@end

NS_ASSUME_NONNULL_END
