//
//  SBSNetworkService.h
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SBSNetworkConstants.h"

NS_ASSUME_NONNULL_BEGIN


@interface SBSNetworkService : NSObject

- (NSURL *)createUrlWithPath:(NSString *)path withQueryItems:(NSArray<NSURLQueryItem *> *)queryItems;
- (NSMutableURLRequest *)createRequestWithMethod:(NSString *)method forURL:(NSURL *)url;
- (void)executeRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(id responseData, NSError *error))completionHandler;

+ (NSURL *)createImageUrlForPath:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
