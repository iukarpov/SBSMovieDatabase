//
//  UIImageView+SBSNetwork.h
//  SBSMovieDatabase
//
//  Created by Igor on 06/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSImageCache.h"

NS_ASSUME_NONNULL_BEGIN


@interface UIImageView(SBSNetwork)

@property (nonatomic, copy) NSURL *imageURL;

- (void)sbsLoadImageFromURL:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END
