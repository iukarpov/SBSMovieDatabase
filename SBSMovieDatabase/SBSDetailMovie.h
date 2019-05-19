//
//  SBSDetailMovie.h
//  SBSMovieDatabase
//
//  Created by Igor on 11/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SBSMovie.h"
#import "SBSActor.h"
NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSInteger, MovieCellType)
{
    MovieShowInfo,
    MovieShowOverview,
    MovieShowRating
};


@interface SBSDetailMovie : SBSMovie

@property (nonatomic, assign) NSUInteger budget;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, copy) NSString *overview;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, assign) NSUInteger revenue;
@property (nonatomic, assign) NSUInteger runtime;
@property (nonatomic, copy) NSString *tagline;
@property (nonatomic, assign) double voteAverage;
@property (nonatomic, assign) NSUInteger voteCount;
@property (nonatomic, strong) NSArray <SBSActor *> *cast;

+ (SBSDetailMovie *)moviesFromDictionaries:(NSDictionary *)movieDictionary;
@end

NS_ASSUME_NONNULL_END
