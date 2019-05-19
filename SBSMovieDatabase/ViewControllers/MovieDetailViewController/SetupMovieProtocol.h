//
//  SetupMovieProtocol.h
//  SBSMovieDatabase
//
//  Created by Igor on 12/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SBSDetailMovie.h"


NS_ASSUME_NONNULL_BEGIN


@protocol SetupMovieProtocol <NSObject>

- (void)setupWithMovie:(SBSDetailMovie *)movie;
@end

NS_ASSUME_NONNULL_END
