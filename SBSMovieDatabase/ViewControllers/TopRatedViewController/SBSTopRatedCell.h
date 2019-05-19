//
//  SBSTopRatedCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import "SBSBaseMovieCell.h"
#import "SBSMovie.h"
#import "SBSNetworkService.h"
#import "UIImageView+SBSNetwork.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSTopRatedCell : SBSBaseMovieCell

- (void)setupWithMovie:(SBSMovie *)movie;
@end

NS_ASSUME_NONNULL_END
