//
//  SBSMovieDetailCastCellTableViewCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 17/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieDetailCastCell.h"


@implementation SBSMovieDetailCastCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureCell];
    }
    return self;
}

- (void) configureCell
{
    self.backgroundColor = UIColor.primaryColor;
    [self setupActorImageView];
    [self setupActorNameLabel];
    [self setupActorRoleLabel];
    [self setupConstraints];
}
- (void)setupActorImageView
{
    _actorImageView = [UIImageView new];
    _actorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _actorImageView.layer.cornerRadius = 10;
    _actorImageView.clipsToBounds = YES;
    _actorImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_actorImageView];
}

- (void)setupActorNameLabel
{
    _actorNameLabel = [UILabel new];
    _actorNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _actorNameLabel.numberOfLines = 0;
    _actorNameLabel.textColor = UIColor.primaryTextColor;
    [_actorNameLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [_actorNameLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.contentView addSubview:_actorNameLabel];
}

- (void)setupActorRoleLabel
{
    _actorRoleLabel = [UILabel new];
    _actorRoleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _actorRoleLabel.numberOfLines = 0;
    _actorRoleLabel.textColor = UIColor.secondaryTextColor;
    [_actorRoleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [_actorRoleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [self.contentView addSubview:_actorRoleLabel];
}

- (void)setupWithActor:(SBSActor *)actor
{
    self.actorNameLabel.text = actor.name;
    self.actorRoleLabel.text = actor.character;
    if (actor.profilePath)
    {
        [self.actorImageView loadImageFromURL:[SBSNetworkService createImageUrlForPath:actor.profilePath]];
    }
}

- (void)setupConstraints
{
    [self.actorImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
     [self.actorImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
     [self.actorImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
    [self.actorImageView.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor multiplier:.15].active = YES;
    [self.actorImageView.heightAnchor constraintEqualToConstant:60].active = YES;
    
    [self.actorNameLabel.leadingAnchor constraintEqualToAnchor:self.actorImageView.trailingAnchor constant:20].active = YES;
    [self.actorNameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    [self.actorNameLabel.topAnchor constraintEqualToAnchor:self.actorImageView.topAnchor constant:10].active = YES;
    [self.actorNameLabel setContentHuggingPriority:760 forAxis:UILayoutConstraintAxisVertical];
    [self.actorNameLabel setContentCompressionResistancePriority:700 forAxis:UILayoutConstraintAxisVertical];
    
    [self.actorRoleLabel.leadingAnchor constraintEqualToAnchor:self.actorImageView.trailingAnchor constant:20].active = YES;
    [self.actorRoleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    [self.actorRoleLabel.topAnchor constraintEqualToAnchor:self.actorNameLabel.topAnchor constant:20].active = YES;
    [self.actorRoleLabel setContentHuggingPriority:800 forAxis:UILayoutConstraintAxisVertical];
    [self.actorRoleLabel setContentCompressionResistancePriority:650 forAxis:UILayoutConstraintAxisVertical];
    
}
@end
