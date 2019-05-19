//
//  SBSMovieDetailViewController.m
//  SBSMovieDatabase
//
//  Created by Igor on 08/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSMovieDetailViewController.h"
#import "SBSNetworkService.h"
#import "UIImageView+SBSNetwork.h"
#import "SBSMovieDetailInfoCell.h"
#import "SBSMovieDetailOverviewCell.h"
#import "SBSMovieDetailRatingCell.h"
#import "SBSMovieService.h"
#import "SBSNetworkService.h"
#import "SBSImageCache.h"


@interface SBSMovieDetailViewController () <UITableViewDelegate, UITableViewDataSource, SBSMovieDetailInfoCellDelegate>

@property (nonatomic, strong) UITableView *movieDetailTableView;
@property (nonatomic, copy) NSString *movieID;
@property (nonatomic, strong) SBSCoreDataService *coreDataService;
@property (nonatomic, strong) SBSMovieService *movieService;
@property (nonatomic, strong) SBSDetailMovie *detailMovie;
@property (nonatomic, strong) FavouriteMovie *favMovie;
@end


@implementation SBSMovieDetailViewController

- (instancetype)initWithMovieID:(NSString *)movieID
{
    self = [super init];
    if (self)
    {
        _movieID = movieID;
    }
    return self;
}

- (void)didTapAddToFavouriteButton:(BOOL)isSelected
{
    if (!isSelected)
    {
        self.favMovie = [self.coreDataService saveDetailMovieToCoreData:self.detailMovie];
    }
    else
    {
        [self.coreDataService deleteFavouriteMovieFromCoreData:self.favMovie];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    SBSCoreDataStack *coreDataStack = [SBSCoreDataStack new];
    self.coreDataService = [[SBSCoreDataService alloc] initWithCoreDataStack:coreDataStack];    self.favMovie = [self.coreDataService findFavouriteMovieWithId:self.movieID];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor primaryTextColor];
    [self fetchMovieData];
    [self setupMovieDetailTableView];
    [self setupConstraints];
}

- (void)setupMovieDetailTableView
{
    self.movieDetailTableView = [UITableView new];
    self.movieDetailTableView.delegate = self;
    self.movieDetailTableView.dataSource = self;
    self.movieDetailTableView.separatorInset = UIEdgeInsetsZero;
    self.movieDetailTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.movieDetailTableView.backgroundColor = UIColor.primaryColor;
    self.movieDetailTableView.estimatedRowHeight = 100;
    self.movieDetailTableView.rowHeight = UITableViewAutomaticDimension;
    [self registerTableViewCells];
    [self.view addSubview:self.movieDetailTableView];
}

- (void)registerTableViewCells
{
    [self.movieDetailTableView registerClass:[SBSMovieDetailInfoCell class] forCellReuseIdentifier:NSStringFromClass([SBSMovieDetailInfoCell class])];
    [self.movieDetailTableView registerClass:[SBSMovieDetailOverviewCell class] forCellReuseIdentifier:NSStringFromClass([SBSMovieDetailOverviewCell class])];
    [self.movieDetailTableView registerClass:[SBSMovieDetailRatingCell class] forCellReuseIdentifier:NSStringFromClass([SBSMovieDetailRatingCell class])];
    [self.movieDetailTableView registerClass:[SBSMovieDetailCastCell class] forCellReuseIdentifier:NSStringFromClass([SBSMovieDetailCastCell class])];
}

- (void)fetchMovieData
{
    self.movieService = [[SBSMovieService alloc] initWithNetworkService:[SBSNetworkService new]];
    [self.movieService fetchDetailMovieInfoWithID:self.movieID andCompletionHandler:^(SBSDetailMovie * _Nonnull movie) {
        self.detailMovie = movie;
        [self.movieDetailTableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1)
    {
        return self.detailMovie.cast.count;
    }
    return  3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return 40;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
        UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, tableView.frame.size.width, 15)];
        [headerTitle setFont:[UIFont boldSystemFontOfSize:16]];
        headerTitle.text = @"Cast";
        headerTitle.textColor = UIColor.primaryTextColor;
        [headerView addSubview:headerTitle];
        [headerView setBackgroundColor:UIColor.secondaryColor];
        return headerView;
    }
    UIView *emptyHeader = [[UIView alloc] initWithFrame:CGRectZero];
    return emptyHeader;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            SBSMovieDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSMovieDetailInfoCell class]) forIndexPath:indexPath];
            cell.delegate = self;
            if (self.favMovie)
            {
                [cell.addToFavouriteButton setSelected:YES];
            }
            [cell setupWithMovie:self.detailMovie];
            return cell;
        }
        if (indexPath.row == 1)
        {
            SBSMovieDetailOverviewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSMovieDetailOverviewCell class]) forIndexPath:indexPath];
            [cell setupWithMovie:self.detailMovie];
            return cell;
        }
        if (indexPath.row == 2)
        {
            SBSMovieDetailRatingCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSMovieDetailRatingCell class]) forIndexPath:indexPath];
            [cell setupWithMovie:self.detailMovie];
            return cell;
        }
    }
    if (indexPath.section == 1)
    {
        SBSMovieDetailCastCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSMovieDetailCastCell class]) forIndexPath:indexPath];
        [cell setupWithActor:self.detailMovie.cast[indexPath.row]];
        return cell;
    }
    return [UITableViewCell new];
}

- (void)setupConstraints
{
    [self.movieDetailTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.movieDetailTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.movieDetailTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.movieDetailTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}


@end


