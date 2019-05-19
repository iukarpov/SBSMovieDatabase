//
//  SBSMovie.h
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *posterPath;
@property (nonatomic, copy) NSString *movieID;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)moviesFromDictionaries:(NSArray *)movieDictionaries;
@end

NS_ASSUME_NONNULL_END
