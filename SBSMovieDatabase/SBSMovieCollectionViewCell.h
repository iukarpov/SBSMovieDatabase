//
//  SBSMovieCollectionViewCell.h
//  SBSMovieDatabase
//
//  Created by Igor on 05/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SBSDetailMovie.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSMovieCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *movieTitleLabel;
@property (nonatomic, strong) UIImageView *moviePosterImageView;
@property (nonatomic, copy) NSString *movieID;

- (void)setupWithMovie:(SBSMovie *)movie;
@end

NS_ASSUME_NONNULL_END
