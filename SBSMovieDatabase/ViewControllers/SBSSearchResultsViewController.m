//
//  SBSSearchResultsViewController.m
//  SBSMovieDatabase
//
//  Created by Igor on 15/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSSearchResultsViewController.h"


@interface SBSSearchResultsViewController () <UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) SBSMovieService *movieService;
@property (nonatomic, strong) NSMutableArray<SBSMovie *> *movies;
@end


@implementation SBSSearchResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMovieCollectionView];
    [self setupSearchBar];
    [self setupConstraints];
    NSLog(@"%@", self.movies);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.searchBar becomeFirstResponder];
}

- (void)setupMovieCollectionView
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor primaryColor];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionView registerClass:[SBSMovieCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SBSMovieCollectionViewCell class])];
    [self.view addSubview:self.collectionView];
}

- (void)setupSearchBar
{
    self.searchBar = [UISearchBar new];
    [self.searchBar setPlaceholder:@"Start Searching"];
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    self.searchBar.delegate = self;
    if (@available(iOS 11.0, *))
    {
        [self.searchBar.heightAnchor constraintEqualToConstant:44].active = YES;
    }
    self.navigationItem.titleView = self.searchBar;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [self.movies removeAllObjects];
    [self searchMoviesWithTitle:searchBar.text];
}

- (void)searchMoviesWithTitle:(NSString *)title
{
    self.movieService = [[SBSMovieService alloc] initWithNetworkService:[SBSNetworkService new]];
    NSMutableURLRequest *request = [self.movieService fetchMovieWithTitle:title];
    [self.movieService fetchMoviesWithRequestAndCompletionHandler:request completionHandler:^(NSArray<SBSMovie *> * _Nonnull movies){
         self.movies = [NSMutableArray arrayWithArray:movies];
         [self.collectionView reloadData];
     }];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBSMovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SBSMovieCollectionViewCell class]) forIndexPath:indexPath];
    if (indexPath.item < self.movies.count && self.movies[indexPath.item] != nil)
    {
        [cell setupWithMovie:self.movies[indexPath.item]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *movieID = self.movies[indexPath.item].movieID;
    SBSMovieDetailViewController *detailViewController = [[SBSMovieDetailViewController alloc] initWithMovieID:movieID];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - UICollectionViewDelegateFlowLayout Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellWidth = CGRectGetWidth(self.collectionView.frame) / 2 - 15;
    CGFloat cellHeight = CGRectGetHeight(self.collectionView.frame) / 2;
    CGSize cellSize = CGSizeMake(cellWidth, cellHeight);
    return cellSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (void)setupConstraints
{
    [self.collectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.collectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.collectionView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.collectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}



@end

