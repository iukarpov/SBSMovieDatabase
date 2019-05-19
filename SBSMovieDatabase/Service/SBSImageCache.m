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
    @try
    {
        [imageCache setObject:image forKey:imageURL.absoluteString];
        return YES;
    }
    @catch (NSException *exception)
    {
        NSLog(@"Unable to cache image. Fail with exception - %@", exception);
        return NO;
    }
    return NO;
}

- (BOOL)removeImageFromCacheForURL:(NSURL *)imageURL
{
    @try
    {
        [imageCache removeObjectForKey:imageURL.absoluteString];
        return  YES;
    }
    @catch (NSException *exception)
    {
        NSLog(@"Unable to remove image from cache. Fail with exception - %@", exception);
        return NO;
    }
    return NO;
}

- (BOOL)removeAllImagesFromCache
{
    @try
    {
        [imageCache removeAllObjects];
        return YES;
    }
    @catch (NSException *exception)
    {
        NSLog(@"Unable to remove images from cache. Fail with exception - %@", exception);
        return NO;
    }
    return NO;
}

@end
