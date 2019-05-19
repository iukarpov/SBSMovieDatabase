//
//  FavouriteMovie+CoreDataProperties.h
//  SBSMovieDatabase
//
//  Created by Igor on 15/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//
//

#import "FavouriteMovie+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface FavouriteMovie (CoreDataProperties)

+ (NSFetchRequest<FavouriteMovie *> *)fetchRequest;

@property (nonatomic) int16_t duration;
@property (nullable, nonatomic, copy) NSString *genre;
@property (nullable, nonatomic, copy) NSString *movieID;
@property (nullable, nonatomic, retain) NSData *poster;
@property (nullable, nonatomic, copy) NSString *releaseDate;
@property (nullable, nonatomic, copy) NSString *title;
@property (nonatomic) double voteAverage;

@end

NS_ASSUME_NONNULL_END
