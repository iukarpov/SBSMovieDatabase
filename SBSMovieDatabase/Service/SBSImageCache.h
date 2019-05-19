//
//  ImageCache.h
//  SBSMovieDatabase
//
//  Created by Igor on 08/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@interface SBSImageCache : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)new NS_UNAVAILABLE;

- (BOOL)cachedImageExistsForURL:(NSURL *)imageUrl;
- (UIImage *)cachedImageForURL:(NSURL *)imageURL;
- (BOOL)addImage:(UIImage *)image toCacheForURL:(NSURL *)imageURL;
- (BOOL)removeImageFromCacheForURL:(NSURL *)imageURL;
- (BOOL)removeAllImagesFromCache;

+ (instancetype)sharedManager;

@end

NS_ASSUME_NONNULL_END
