//
//  ImageCache.m
//  SBSMovieDatabase
//
//  Created by Igor on 08/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSImageCache.h"


static NSCache *imageCache;


@implementation SBSImageCache

+ (instancetype)sharedManager
{
    static SBSImageCache *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        imageCache = [[NSCache alloc] init];
    });
    return sharedManager;
}

- (BOOL)cachedImageExistsForURL:(NSURL *)imageUrl
{
    if ([imageCache objectForKey:imageUrl.absoluteString])
    {
        return YES;
    }
    return NO;
}

- (UIImage *)cachedImageForURL:(NSURL *)imageURL
{
    if([self cachedImageExistsForURL:imageURL])
    {
        return [imageCache objectForKey:imageURL.absoluteString];
    }
    return nil;
}

- (BOOL)addImage:(UIImage *)image toCacheForURL:(NSURL *)imageURL
{
    [imageCache setObject:image forKey:imageURL.absoluteString];
    return YES;
    
}

- (BOOL)removeImageFromCacheForURL:(NSURL *)imageURL
{
    [imageCache removeObjectForKey:imageURL.absoluteString];
    return  YES;
}

- (BOOL)removeAllImagesFromCache
{
    [imageCache removeAllObjects];
    return YES;
}

@end

