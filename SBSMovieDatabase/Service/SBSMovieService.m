//
//  SBSMovieService.m
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieService.h"


@implementation SBSMovieService

- (instancetype)initWithNetworkService:(SBSNetworkService *)networkService
{
    self = [super init];
    if (!self) return nil;
    
    self.networkService = networkService;
    return self;
}

- (NSMutableURLRequest *)fetchPopularMoviesRequest
{
    NSArray<NSURLQueryItem *> *queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:SBSApiKey], [NSURLQueryItem queryItemWithName:@"sort_by" value:@"popularity.desc"]];
    NSURL* url = [self.networkService createUrlWithPath:SBSDiscoverMoviePath withQueryItems:queryItems];
    NSMutableURLRequest* request = [self.networkService createRequestWithMethod:@"GET" forURL:url];
    return  request;
}

- (NSMutableURLRequest *)fetchMovieWithTitle:(NSString *)title
{
    NSArray<NSURLQueryItem *> *queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:SBSApiKey], [NSURLQueryItem queryItemWithName:@"query" value:title]];
    NSURL* url = [self.networkService createUrlWithPath:SBSMovieWithTitlePath withQueryItems:queryItems];
    NSMutableURLRequest* request = [self.networkService createRequestWithMethod:@"GET" forURL:url];
    return  request;
}

- (NSMutableURLRequest *)fetchTopRatedMovies
{
    NSArray<NSURLQueryItem *> *queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:SBSApiKey]];
    NSURL* url = [self.networkService createUrlWithPath:SBSTopRatedMoviePath withQueryItems:queryItems];
    NSMutableURLRequest* request = [self.networkService createRequestWithMethod:@"GET" forURL:url];
    return  request;
}

- (void)fetchMoviesWithRequestAndCompletionHandler:(NSMutableURLRequest *)request completionHandler:(void (^)(NSArray<SBSMovie *> *movies))completionHandler
{
    [self.networkService executeRequest:request withCompletionHandler:^(id responseData, NSError *error)
     {
         if (error)
         {
             NSLog(@"Network error occurred: %@", [error localizedDescription]);
             completionHandler(nil);
             return;
         }
         NSError *parsingError;
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&parsingError];
         if (parsingError)
         {
             NSLog(@"An error occured: %@", [parsingError localizedDescription]);
             completionHandler(nil);
             return;
         }
         dispatch_async(dispatch_get_main_queue(), ^(){
             completionHandler([SBSMovie moviesFromDictionaries:json[@"results"]]);
         });
     }];
}

- (void)fetchDetailMovieInfoWithID:(NSString *)movieID andCompletionHandler:(void (^)(SBSDetailMovie *movie))completionHandler
{
    NSString *path = [NSString stringWithFormat:@"%@/%@", SBSDetailMovieInfoPath, movieID];
    NSArray<NSURLQueryItem *> *queryItems = @[[NSURLQueryItem queryItemWithName:@"api_key" value:SBSApiKey], [NSURLQueryItem queryItemWithName:@"append_to_response" value:@"credits"],[NSURLQueryItem queryItemWithName:@"language" value:@"en-US"]];
    NSURL* url = [self.networkService createUrlWithPath:path withQueryItems:queryItems];
    NSMutableURLRequest* request = [self.networkService createRequestWithMethod:@"GET" forURL:url];
    [self.networkService executeRequest:request withCompletionHandler:^(id responseData, NSError *error)
     {
         if (error)
         {
             NSLog(@"Network error occurred: %@", [error localizedDescription]);
             completionHandler(nil);
             return;
         }
         NSError *parsingError;
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:&parsingError];
         if (parsingError)
         {
             NSLog(@"An error occured: %@", [parsingError localizedDescription]);
             completionHandler(nil);
             return;
         }
         dispatch_async(dispatch_get_main_queue(), ^(){
             completionHandler([SBSDetailMovie moviesFromDictionaries:json]);
         });
     }];
}

@end
