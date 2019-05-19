//
//  SBSNetworkService.m
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSNetworkService.h"


@implementation SBSNetworkService

- (NSURL *)createUrlWithPath:(NSString *)path withQueryItems:(NSArray<NSURLQueryItem *> *)queryItems
{
    if (!path && !queryItems)
    {
        return nil;
    }
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:BaseUrlString];
    urlComponents.path = path;
    urlComponents.queryItems = [@[] arrayByAddingObjectsFromArray:queryItems];
    NSLog(@"URL: %@", urlComponents.URL);
    return urlComponents.URL;
}

- (NSMutableURLRequest *)createRequestWithMethod:(NSString *)method forURL:(NSURL *)url
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:method];
    return request;
    
}

- (void)executeRequest:(NSURLRequest *)request withCompletionHandler:(void (^)(id responseData, NSError *error))completionHandler
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error)
        {
            NSLog(@"Network error occurred: %@", [error localizedDescription]);
            dispatch_async(dispatch_get_main_queue(), ^(void) { completionHandler(nil, error);
            });
            return;
        }
    if ([response isKindOfClass:NSHTTPURLResponse.class])
    {
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        if (statusCode != 200)
        {
            NSLog(@"Network error occurred. Status code: %ld", (long)statusCode);
            return;
        }
    }
        completionHandler(data, nil);
    }];
    [dataTask resume];
}

+ (NSURL *)createImageUrlForPath:(NSString *)path
{
    if ([path isKindOfClass:[NSNull class]])
    {
        return nil;
    }
    NSURL *url = [NSURL URLWithString:[ImageUrl stringByAppendingString:path]];
    return url;
}


@end
