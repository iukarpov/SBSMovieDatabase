//
//  SBSTopRatedViewController.m
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSTopRatedViewController.h"


@interface SBSTopRatedViewController ()

@property (nonatomic, strong) NSArray<SBSMovie *> *topRatedMovies;
@end


@implementation SBSTopRatedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchData];
    [self setupTableView];
}

- (void)setupTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 150;
    [self.tableView registerClass:[SBSTopRatedCell class] forCellReuseIdentifier:NSStringFromClass([SBSTopRatedCell class])];
}

- (void)fetchData
{
    self.movieService = [[SBSMovieService alloc] initWithNetworkService:[SBSNetworkService new]];
    NSMutableURLRequest *request = [self.movieService fetchTopRatedMovies];
    [self.movieService fetchMoviesWithRequestAndCompletionHandler:request completionHandler:^(NSArray<SBSMovie *> * _Nonnull movies)
     {
         self.topRatedMovies = movies;
         [self.tableView reloadData];
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topRatedMovies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBSTopRatedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSTopRatedCell class]) forIndexPath:indexPath];
    [cell setupWithMovie:self.topRatedMovies[indexPath.row]];
    return cell;
}

@end
