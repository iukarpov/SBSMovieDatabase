//
//  SBSMenuBar.m
//  SBSMovieDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMenuBar.h"
#import "UIColor+SBSCustomColors.h"
#import "SBSMenuBarCell.h"


@implementation SBSMenuBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setupCollectionView];
    }
    return self;
}

- (void)setupCollectionView
{
    self.menuBarImages = @[@"profile" ,@"tape" ,@"favorite"];
    self.menuBarTitles = @[@"Profile" ,@"Top Rated" ,@"Favourite"];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.menuCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.menuCollectionView.backgroundColor = [UIColor secondaryColor];
    self.menuCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.menuCollectionView.delegate = self;
    self.menuCollectionView.dataSource = self;
    [self.menuCollectionView registerClass:[SBSMenuBarCell class] forCellWithReuseIdentifier:NSStringFromClass([SBSMenuBarCell class])];
    [self addSubview:self.menuCollectionView];
    [self setupConstraints];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.menuBarImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBSMenuBarCell *cell = [self.menuCollectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SBSMenuBarCell class]) forIndexPath:indexPath];
    cell.menuBarImageView.image = [UIImage imageNamed: [self.menuBarImages objectAtIndex:indexPath.item]];
    cell.menuBarTitle.text = [self.menuBarTitles objectAtIndex:indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBSMenuBarCell *cell = (SBSMenuBarCell *)[self.menuCollectionView cellForItemAtIndexPath:indexPath];
    [self.menuBarDelegate didTapMenuBarSectionWithTitle:cell.menuBarTitle.text];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/3, self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return  0;
}

- (void)setupConstraints
{
    [self.menuCollectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [self.menuCollectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    [self.menuCollectionView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [self.menuCollectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
}



@end
