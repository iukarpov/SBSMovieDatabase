//
//  SBSDetailMovie.m
//  SBSMovieDatabase
//
//  Created by Igor on 11/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSDetailMovie.h"


@implementation SBSDetailMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
     if (self = [super initWithDictionary:dictionary])
    {
        if (dictionary[@"budget"])
        {
            self.budget = [dictionary[@"budget"] integerValue];;
        }

        if (dictionary[@"genres"])
        {
            self.genre = [self movieGenreFromGenreIdArray:dictionary[@"genres"]];
        }
  
        if (dictionary[@"overview"])
        {
            self.overview = dictionary[@"overview"];
        }
    
        if (dictionary[@"release_date"])
        {
            
            self.releaseDate = dictionary[@"release_date"];
        }
  
        if (dictionary[@"revenue"])
        {
            self.revenue = [dictionary[@"revenue"] integerValue];
        }
   
        if (dictionary[@"runtime"])
        {
            if(![dictionary[@"runtime"] isEqual:[NSNull null]])
            {
                self.runtime = [dictionary[@"runtime"] integerValue];
            }
        }
 
        if (dictionary[@"tagline"])
        {
            self.tagline = dictionary[@"tagline"];
        }
  
        if (dictionary[@"vote_average"])
        {
            self.voteAverage = [dictionary[@"vote_average"] doubleValue];
        }
 
        if (dictionary[@"vote_count"])
        {
            self.voteCount = [dictionary[@"vote_count"] integerValue];
        }
        if (dictionary[@"credits"])
        {
            NSDictionary *credits = [NSDictionary dictionaryWithDictionary:dictionary[@"credits"]];
            NSArray *actors = [NSArray arrayWithArray:credits[@"cast"]];
            self.cast = [self actorsFromDictionary:actors];
            self.voteCount = [dictionary[@"vote_count"] integerValue];
        }
    }
    return  self;
}

+ (SBSDetailMovie *)moviesFromDictionaries:(NSDictionary *)movieDictionary
{
    SBSDetailMovie *detailMovie = [[SBSDetailMovie alloc] initWithDictionary:movieDictionary];
    return detailMovie;
}

- (NSString *)movieGenreFromGenreIdArray:(NSArray *)genreIdArray
{
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for(NSDictionary *dict in genreIdArray){
        NSString *name = [dict objectForKey:@"name"];
        
        [temp addObject:name];
    }
    NSString * genre = [[temp valueForKey:@"description"] componentsJoinedByString:@", "];
    return genre;
}

- (NSArray *)actorsFromDictionary:(NSArray *)actorsDictionariy
{
    NSMutableArray *actors = [NSMutableArray new];
    for (NSDictionary *person in actorsDictionariy)
    {
        SBSActor *actor = [[SBSActor alloc] initWithDictionary:person];
        [actors addObject:actor];
    }
    return actors;
}

@end

