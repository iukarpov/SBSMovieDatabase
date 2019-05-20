//
//  SBSHomeCollectioViewHeader.m
//  SBSMovieDatabase
//
//  Created by Igor on 16/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSHomeCollectionViewHeader.h"


@implementation SBSHomeCollectionViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.sbsBackgroundPrimaryColor;
        [self setupMenuBarTitle];
        [self setupConstraints];
    }
    return self;
}

- (void)setupMenuBarTitle
{
    _headerTitleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    _headerTitleLabel.textColor = UIColor.sbsPrimaryTextColor;
    _headerTitleLabel.textAlignment = NSTextAlignmentCenter;
    [_headerTitleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    _headerTitleLabel.text = @"Popular";
    _headerTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_headerTitleLabel];
}

- (void)setupConstraints
{
    [self.headerTitleLabel.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20].active = YES;
    [self.headerTitleLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
}
@end
