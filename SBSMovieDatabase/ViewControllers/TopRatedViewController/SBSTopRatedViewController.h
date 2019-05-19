//
//  SBSTopRatedViewController.h
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSBaseMovieCell.h"
#import "UIColor+SBSCustomColors.h"
#import "SBSMovieService.h"
#import "SBSNetworkService.h"
#import "SBSTopRatedCell.h"


NS_ASSUME_NONNULL_BEGIN

@interface SBSTopRatedViewController : UITableViewController
@property (nonatomic, strong) SBSMovieService *movieService;

@end

NS_ASSUME_NONNULL_END
