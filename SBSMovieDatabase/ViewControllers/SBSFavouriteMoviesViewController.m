//
//  SBSFavouriteMoviesViewController.m
//  SBSMovieDatabase
//
//  Created by Igor on 14/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSFavouriteMoviesViewController.h"


@interface SBSFavouriteMoviesViewController () <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *favouriteMoviesTableView;
@property (nonatomic, strong) SBSCoreDataService *coreDataService;
@end


@implementation SBSFavouriteMoviesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Favourite Movies";
    SBSCoreDataStack *coreDataStack = [SBSCoreDataStack new];
    self.coreDataService = [[SBSCoreDataService alloc] initWithCoreDataStack:coreDataStack];    NSFetchRequest *request = [self.coreDataService createFetchRequest];
    self.fetchedResultsController = [self.coreDataService createFetchedResultsControllerWithRequestAndDelegate:request delegate:self];
    [self setupFavouriteMoviesTableView];
    [self setupConstraints];
}

- (void)setupFavouriteMoviesTableView
{
    _favouriteMoviesTableView = [UITableView new];
    _favouriteMoviesTableView.delegate = self;
    _favouriteMoviesTableView.dataSource = self;
    _favouriteMoviesTableView.rowHeight = UITableViewAutomaticDimension;
    _favouriteMoviesTableView.estimatedRowHeight = 150;
    _favouriteMoviesTableView.separatorInset = UIEdgeInsetsZero;
    _favouriteMoviesTableView.translatesAutoresizingMaskIntoConstraints = NO;
    _favouriteMoviesTableView.backgroundColor = UIColor.primaryColor;
    [_favouriteMoviesTableView registerClass:[SBSFavouriteMovieCell class] forCellReuseIdentifier:NSStringFromClass([SBSFavouriteMovieCell class])];
    [self.view addSubview:self.favouriteMoviesTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SBSFavouriteMovieCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SBSFavouriteMovieCell class]) forIndexPath:indexPath];
    [cell setupWithFavouriteMovie:[[self fetchedResultsController] objectAtIndexPath:indexPath]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FavouriteMovie *movie = [self.fetchedResultsController objectAtIndexPath:indexPath];
    SBSMovieDetailViewController *detailViewController = [[SBSMovieDetailViewController alloc] initWithMovieID:movie.movieID];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [self.favouriteMoviesTableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.favouriteMoviesTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        FavouriteMovie *favMovie = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.coreDataService deleteFavouriteMovieFromCoreData:favMovie];
    }
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.favouriteMoviesTableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(nullable NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(nullable NSIndexPath *)newIndexPath
{
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.favouriteMoviesTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.favouriteMoviesTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            break;
        case NSFetchedResultsChangeMove:
            [self.favouriteMoviesTableView moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type{
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
            [self.favouriteMoviesTableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.favouriteMoviesTableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.favouriteMoviesTableView endUpdates];
}

- (void)setupConstraints
{
    [self.favouriteMoviesTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    [self.favouriteMoviesTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.favouriteMoviesTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.favouriteMoviesTableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

@end
