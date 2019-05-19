//
//  SBSMovieDetailCastCellTableViewCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 17/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SetupMovieProtocol.h"
#import "UIColor+SBSCustomColors.h"
#import "UIImageView+SBSNetwork.h"
#import "SBSNetworkService.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieDetailCastCell : UITableViewCell

@property (nonatomic, strong) UIImageView *actorImageView;
@property (nonatomic, strong) UILabel *actorNameLabel;
@property (nonatomic, strong) UILabel *actorRoleLabel;

- (void)setupWithActor:(SBSActor *)actor;
@end

NS_ASSUME_NONNULL_END
