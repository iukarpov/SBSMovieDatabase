//
//  UIImageView+SBSNetwork.m
//  SBSMovieDatabase
//
//  Created by Igor on 06/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//



#import "UIImageView+SBSNetwork.h"
#import <objc/runtime.h>


static char URL_KEY;


@implementation UIImageView(SBSNetwork)

@dynamic imageURL;

- (void)sbsLoadImageFromURL:(NSURL *)url
{
    if (!url)
    {
        self.image = [UIImage imageNamed:@"placeholder"];
    }
    self.imageURL = url;
    SBSImageCache *imageCache = [SBSImageCache sharedManager];
    if ([imageCache cachedImageExistsForURL:url])
    {
        self.image = [imageCache cachedImageForURL:url];
        return;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *imageFromData = [UIImage imageWithData:data];
        NSLog(@"1111%@",self.imageURL);
        [imageCache addImage:imageFromData toCacheForURL:self.imageURL];
        if (imageFromData)
        {
            if ([self.imageURL.absoluteString isEqualToString:url.absoluteString])
            {
                dispatch_sync(dispatch_get_main_queue(), ^{
                    self.image = imageFromData;
                });
            } else
            {
                NSLog(@"Urls are not the same");
            }
        }
    });
}
- (void) setImageURL:(NSURL *)newImageURL
{
    objc_setAssociatedObject(self, &URL_KEY, newImageURL, OBJC_ASSOCIATION_COPY);
}

- (NSURL*) imageURL
{
    return objc_getAssociatedObject(self, &URL_KEY);
}

@end


