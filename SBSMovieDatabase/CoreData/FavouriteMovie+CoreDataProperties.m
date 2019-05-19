//
//  FavouriteMovie+CoreDataProperties.m
//  SBSMovieDatabase
//
//  Created by Igor on 15/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//
//

#import "FavouriteMovie+CoreDataProperties.h"

@implementation FavouriteMovie (CoreDataProperties)

+ (NSFetchRequest<FavouriteMovie *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"FavouriteMovie"];
}

@dynamic duration;
@dynamic genre;
@dynamic movieID;
@dynamic poster;
@dynamic releaseDate;
@dynamic title;
@dynamic voteAverage;

@end
