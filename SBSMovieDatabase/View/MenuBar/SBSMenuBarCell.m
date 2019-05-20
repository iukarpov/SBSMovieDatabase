//
//  SBSMenuBarCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 25/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMenuBarCell.h"


@implementation SBSMenuBarCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self configureCell];
    }
    return self;
}

- (void)configureCell
{
    [self setupMenuBarImage];
    [self setupMenuBarTitle];
    [self addConstraints];
}

- (void)setupMenuBarImage
{
    _menuBarImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:_menuBarImageView];
    _menuBarImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setupMenuBarTitle
{
    _menuBarTitle = [[UILabel alloc]initWithFrame:CGRectZero];
    _menuBarTitle.textColor = UIColor.sbsPrimaryTextColor;
    _menuBarTitle.textAlignment = NSTextAlignmentCenter;
    _menuBarTitle.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_menuBarTitle];
}

- (void)addConstraints
{
    [_menuBarImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:15].active = YES;
    [_menuBarImageView.heightAnchor constraintEqualToConstant:30].active = YES;
   
    [_menuBarImageView.widthAnchor constraintEqualToConstant:30].active = YES;
    [_menuBarImageView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [_menuBarTitle.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [_menuBarTitle.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [_menuBarTitle.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [_menuBarTitle.topAnchor constraintEqualToAnchor:self.menuBarImageView.bottomAnchor].active = YES;
}
@end
