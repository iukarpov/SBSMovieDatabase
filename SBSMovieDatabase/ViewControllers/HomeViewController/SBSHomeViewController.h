//
//  SBSStartViewController.h
//  SBSMovieDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSMenuBar.h"
#import "UIColor+SBSCustomColors.h"
#import "SBSMovieCollectionViewCell.h"
#import "SBSMovieService.h"
#import "SBSMovieDetailViewController.h"
#import "SBSFavouriteMoviesViewController.h"
#import "SBSSearchResultsViewController.h"
#import "SBSHomeCollectionViewHeader.h"
#import "SBSTopRatedViewController.h"
NS_ASSUME_NONNULL_BEGIN


@interface SBSHomeViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MenuBarDelegate>

@end

NS_ASSUME_NONNULL_END
