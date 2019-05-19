//
//  SBSStartViewController.m
//  SBSMovieDatabase
//
//  Created by Igor on 24/04/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSHomeViewController.h"


@interface SBSHomeViewController ()

@property (nonatomic, strong) SBSMenuBar *menuBar;
@property (nonatomic, strong) UICollectionView *movieCollectionView;
@property (nonatomic, strong) NSArray<SBSMovie *> *popularMovies;
@property (nonatomic, strong) SBSMovieService *movieService;
@property (nonatomic, strong) SBSSearchResultsViewController *searchResultsViewController;
@end


@implementation SBSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBarViews];
    [self fetchDataForCollectionView];
    [self setupMenuBar];
    [self setupMovieCollectionView];
    [self setupConstraints];
}

- (void)setupMenuBar
{
    self.menuBar = [SBSMenuBar new];
    self.menuBar.menuBarDelegate = self;
    self.menuBar.backgroundColor = [UIColor secondaryColor];
    self.menuBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.menuBar];
}

- (void)setupNavigationBarViews
{
    UIImage *menuLogoImage = [UIImage imageNamed:@"logoLight"];
    UIImageView *menuLogoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    menuLogoImageView.contentMode = UIViewContentModeScaleAspectFit;
    menuLogoImageView.image = menuLogoImage;
    menuLogoImageView.image = [menuLogoImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [menuLogoImageView setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithCustomView:menuLogoImageView];
    [menuLogoImageView.widthAnchor constraintEqualToConstant:40].active = YES;
    [menuLogoImageView.heightAnchor constraintEqualToConstant:40].active = YES;
    self.navigationItem.leftBarButtonItem = imageItem;
    
    UIButton* searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchButton sizeToFit];
    [searchButton addTarget:self action:@selector(handleSearch) forControlEvents:UIControlEventTouchUpInside];
    [searchButton.widthAnchor constraintEqualToConstant:20].active = YES;
    [searchButton.heightAnchor constraintEqualToConstant:20].active = YES;
    UIBarButtonItem* customBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    self.navigationItem.rightBarButtonItem = customBarButtonItem;
}

- (void)setupMovieCollectionView
{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10.0;
    layout.minimumInteritemSpacing = 10.0;
    self.movieCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.movieCollectionView.dataSource = self;
    self.movieCollectionView.delegate = self;
    self.movieCollectionView.backgroundColor = [UIColor secondaryColor];
    [self.movieCollectionView setShowsHorizontalScrollIndicator:NO];
    self.movieCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.movieCollectionView registerClass:[SBSMovieCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SBSMovieCollectionViewCell class])];
    [self.movieCollectionView registerClass: [SBSHomeCollectionViewHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([SBSHomeCollectionViewHeader class])];
    [self.view addSubview:self.movieCollectionView];
}

- (void)handleSearch
{
    SBSSearchResultsViewController *searchResults = [SBSSearchResultsViewController new];
    [self.navigationController pushViewController:searchResults animated:YES];
}

- (void)didTapMenuBarSectionWithTitle:(NSString *)title
{
    if ([title isEqualToString:@"Favourite"])
    {
        SBSFavouriteMoviesViewController *favouriteMovies = [SBSFavouriteMoviesViewController new];
        [self.navigationController pushViewController:favouriteMovies animated:YES];
    }
    if ([title isEqualToString:@"Top Rated"])
    {
        NSLog(@"%@",title);
        SBSTopRatedViewController *topRated = [SBSTopRatedViewController new];
        [self.navigationController pushViewController:topRated animated:YES];
    }
}

- (void)fetchDataForCollectionView
{
    self.movieService = [[SBSMovieService alloc] initWithNetworkService:[SBSNetworkService new]];
    NSMutableURLRequest *request = [self.movieService fetchPopularMoviesRequest];
    
    [self.movieService fetchMoviesWithRequestAndCompletionHandler:request completionHandler:^(NSArray<SBSMovie *> * _Nonnull movies)
     {
         self.popularMovies = movies;
         [self.movieCollectionView reloadData];
     }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.popularMovies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SBSMovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SBSMovieCollectionViewCell class]) forIndexPath:indexPath];
    [cell setupWithMovie:self.popularMovies[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *movieID = self.popularMovies[indexPath.item].movieID;
    SBSMovieDetailViewController *detailViewController = [[SBSMovieDetailViewController alloc] initWithMovieID:movieID];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
        CGFloat cellWidth = CGRectGetWidth(self.movieCollectionView.frame) / 2 - 15;
        CGFloat cellHeight = CGRectGetHeight(self.movieCollectionView.frame) / 2;
        CGSize cellSize = CGSizeMake(cellWidth, cellHeight);
    return cellSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier: NSStringFromClass([SBSHomeCollectionViewHeader class]) forIndexPath:indexPath];
    return header;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat headerViewWidth = CGRectGetWidth(self.view.frame);
    CGFloat headerViewHeight = 40;

    return CGSizeMake(headerViewWidth, headerViewHeight);
}

- (void)setupConstraints
{
    [self.movieCollectionView.topAnchor constraintEqualToAnchor:self.menuBar.bottomAnchor].active = YES;
    [self.movieCollectionView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.movieCollectionView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.movieCollectionView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
    [self.menuBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.menuBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.menuBar.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.menuBar.heightAnchor constraintEqualToConstant:80].active = YES;
}
@end
