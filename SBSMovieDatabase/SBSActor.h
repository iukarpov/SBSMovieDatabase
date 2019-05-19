//
//  SBSActor.h
//  SBSMovieDatabase
//
//  Created by Igor on 17/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface SBSActor : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *character;
@property (nonatomic, copy) NSString *profilePath;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
