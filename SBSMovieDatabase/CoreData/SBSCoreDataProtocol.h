//
//  SBSCoreDataProtocol.h
//  SBSMovieDatabase
//
//  Created by Igor on 16/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "FavouriteMovie+CoreDataClass.h"
#import "SBSDetailMovie.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SBSCoreDataProtocol <NSObject>

- (FavouriteMovie *)saveDetailMovieToCoreData:(SBSDetailMovie *)detailMovie;
- (FavouriteMovie *)findFavouriteMovieWithId:(NSString *)Id;
- (void)deleteFavouriteMovieFromCoreData:(FavouriteMovie *)favMovie;
- (NSFetchRequest *)createFetchRequest;

@end

NS_ASSUME_NONNULL_END
