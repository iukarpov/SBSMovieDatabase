//
//  SBSMenuBar.h
//  SBSMovieDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@protocol MenuBarDelegate <NSObject>

- (void)didTapMenuBarSectionWithTitle:(NSString *)title;
@end


@interface SBSMenuBar : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *menuCollectionView;
@property (nonatomic, copy) NSArray *menuBarImages;
@property (nonatomic, copy) NSArray *menuBarTitles;
@property (nonatomic, weak) id<MenuBarDelegate> menuBarDelegate;
@end

NS_ASSUME_NONNULL_END
