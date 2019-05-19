//
//  SBSMovie.m
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovie.h"


@implementation SBSMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{    
    if (self = [super init])
    {
        if (dictionary[@"title"])
        {
            self.title = dictionary[@"title"];
        }
        if (dictionary[@"poster_path"])
        {
            self.posterPath = dictionary[@"poster_path"];
        }
        
        if (dictionary[@"id"])
        {
            self.movieID =  [dictionary[@"id"] stringValue];
        }
    }
    return self;
}

+ (NSArray *)moviesFromDictionaries:(NSArray *)movieDictionaries
{
    NSMutableArray *movies = [NSMutableArray new];
    for (NSDictionary *movieDict in movieDictionaries)
    {
        SBSMovie *popularMovie = [[SBSMovie alloc] initWithDictionary:movieDict];
        [movies addObject:popularMovie];
    }
    return movies;
}

@end
