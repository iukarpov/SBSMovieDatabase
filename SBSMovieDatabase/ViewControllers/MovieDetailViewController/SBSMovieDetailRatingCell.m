//
//  SBSMovieRatingCell.m
//  SBSMovieDatabase
//
//  Created by Igor on 11/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieDetailRatingCell.h"


@implementation SBSMovieDetailRatingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self configureCell];
    }
    return self;
}

- (void)configureCell
{
    self.backgroundColor = UIColor.sbsBackgroundPrimaryColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupMovieRatingLabel];
    [self setupStarImageView];
    [self setupMovieVotesLabel];
    [self setupStackView];
    [self setupBudgetLabel];
    [self setupRevenueLabel];
    [self setupConstraints];
}

- (void)setupStarImageView
{
    _starImage = [UIImageView new];
    _starImage.translatesAutoresizingMaskIntoConstraints = NO;
    _starImage.clipsToBounds = YES;
    _starImage.contentMode = UIViewContentModeScaleAspectFill;
    [_starImage.heightAnchor constraintEqualToConstant:25].active = YES;
    [_starImage.widthAnchor constraintEqualToConstant:25].active = YES;

}

- (void)setupMovieRatingLabel
{
    _movieRatingLabel = [UILabel new];
    _movieRatingLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieRatingLabel.numberOfLines = 0;
    _movieRatingLabel.textColor = UIColor.sbsPrimaryTextColor;
    [_movieRatingLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [_movieRatingLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}

- (void)setupMovieVotesLabel
{
    _movieVotesLabel = [UILabel new];
    _movieVotesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieVotesLabel.numberOfLines = 0;
    _movieVotesLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieVotesLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [_movieVotesLabel.heightAnchor constraintEqualToConstant:20].active = YES;
}
- (void)setupBudgetLabel
{
    _movieBudgetLabel = [UILabel new];
    _movieBudgetLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieBudgetLabel.numberOfLines = 0;
    _movieBudgetLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieBudgetLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.contentView addSubview:_movieBudgetLabel];
}

- (void)setupRevenueLabel
{
    _movieRevenueLabel = [UILabel new];
    _movieRevenueLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _movieRevenueLabel.numberOfLines = 0;
    _movieRevenueLabel.textColor = UIColor.sbsSecondaryTextColor;
    [_movieRevenueLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [self.contentView addSubview:_movieRevenueLabel];
    
}

- (void)setupStackView
{
    _stackView = [UIStackView new];
    _stackView.translatesAutoresizingMaskIntoConstraints = NO;
    _stackView.distribution = UIStackViewDistributionEqualSpacing;
    _stackView.alignment = UIStackViewAlignmentCenter;
    _stackView.spacing = 2.0;
    _stackView.axis = UILayoutConstraintAxisVertical;
    
    [self.stackView addArrangedSubview:self.starImage];
    [self.stackView addArrangedSubview:self.movieRatingLabel];
    [self.stackView addArrangedSubview:self.movieVotesLabel];
    [self.contentView addSubview:self.stackView];
}

- (void)setupWithMovie:(SBSDetailMovie *)movie
{
    self.movieRatingLabel.attributedText = [self addAttributesToStrings:[NSString stringWithFormat:@"%.01f", movie.voteAverage] rs:@"/10" fontSize:16];
    self.movieVotesLabel.text = [@(movie.voteCount) stringValue];
    self.starImage.image = [UIImage imageNamed:@"star"];
    self.movieBudgetLabel.attributedText = [self addAttributesToStrings:@"Budget: " rs:[NSString stringWithFormat:@"%@ $", [@(movie.budget) stringValue]] fontSize:14];
    self.movieRevenueLabel.attributedText = [self addAttributesToStrings:@"Gross: " rs:[NSString stringWithFormat:@"%@ $", [@(movie.revenue) stringValue]] fontSize:14];
}

- (void)setupConstraints
{
    [self.movieBudgetLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    [self.movieBudgetLabel.topAnchor constraintEqualToAnchor:self.stackView.topAnchor constant:10].active = YES;
    
    [self.movieRevenueLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-20].active = YES;
    [self.movieRevenueLabel.bottomAnchor constraintEqualToAnchor:self.stackView.bottomAnchor constant:-10].active = YES;
    
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant: 40].active = YES;
    [self.stackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant: 10].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant: -10].active = YES;
}

- (NSMutableAttributedString *)addAttributesToStrings:(NSString *)ls rs:(NSString *)rs fontSize:(CGFloat)fontSize
{
    NSString *sourceString = [NSString stringWithFormat:@"%@%@", ls, rs];
    NSMutableAttributedString *attributedString =[[NSMutableAttributedString alloc] initWithString:sourceString];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor sbsPrimaryTextColor] range:[sourceString rangeOfString:ls]];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontSize] range:[sourceString rangeOfString:ls]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor sbsSecondaryTextColor] range:[sourceString rangeOfString:rs]];
    return attributedString;
}

@end
