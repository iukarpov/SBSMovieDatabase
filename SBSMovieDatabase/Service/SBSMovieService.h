//
//  SBSMovieService.h
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SBSNetworkService.h"
#import "SBSMovie.h"
#import "SBSDetailMovie.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieService : NSObject

@property (nonatomic, strong) SBSNetworkService *networkService;

- (instancetype)initWithNetworkService:(SBSNetworkService *)networkService;
- (NSMutableURLRequest *)fetchPopularMoviesRequest;
- (NSMutableURLRequest *)fetchTopRatedMovies;
- (NSMutableURLRequest *)fetchMovieWithTitle:(NSString *)title;
- (void)fetchMoviesWithRequestAndCompletionHandler:(NSMutableURLRequest *)request completionHandler:(void (^)(NSArray<SBSMovie *> *movies))completionHandler;
- (void)fetchDetailMovieInfoWithID:(NSString *)movieID andCompletionHandler:(void (^)(SBSDetailMovie *movie))completionHandler;

@end

NS_ASSUME_NONNULL_END
