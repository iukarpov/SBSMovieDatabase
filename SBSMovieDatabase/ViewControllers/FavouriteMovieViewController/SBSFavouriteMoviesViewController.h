//
//  SBSFavouriteMoviesViewController.h
//  SBSMovieDatabase
//
//  Created by Igor on 14/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSFavouriteMovieCell.h"
#import "UIColor+SBSCustomColors.h"
#import "FavouriteMovie+CoreDataClass.h"
#import "AppDelegate.h"
#import "SBSMovieDetailViewController.h"
#import "SBSCoredataService.h"
@import CoreData;


NS_ASSUME_NONNULL_BEGIN


@interface SBSFavouriteMoviesViewController : UIViewController

@property (nonatomic, strong) NSFetchedResultsController<FavouriteMovie *> *fetchedResultsController;
@end

NS_ASSUME_NONNULL_END
