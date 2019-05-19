//
//  SBSMovieDetailViewController.h
//  SBSMovieDatabase
//
//  Created by Igor on 08/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSMovie.h"
#import "UIColor+SBSCustomColors.h"
#import "FavouriteMovie+CoreDataClass.h"
#import "SBSCoreDataService.h"
#import "SBSMovieDetailCastCell.h"
@import  CoreData;


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieDetailViewController : UIViewController 

- (instancetype)initWithMovieID:(NSString *)movieID;
@end

NS_ASSUME_NONNULL_END
