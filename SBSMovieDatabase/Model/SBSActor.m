//
//  SBSActor.m
//  SBSMovieDatabase
//
//  Created by Igor on 17/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSActor.h"


@implementation SBSActor

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    if (self = [super init])
    {
        if (dictionary[@"name"])
        {
            self.name = dictionary[@"name"];
        }
        if (dictionary[@"character"])
        {
            self.character = dictionary[@"character"];
        }
        if (dictionary[@"profile_path"])
        {
            self.profilePath = dictionary[@"profile_path"];
        }
    }
    return self;
}
@end
