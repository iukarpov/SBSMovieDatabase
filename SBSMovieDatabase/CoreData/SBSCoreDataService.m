//
//  SBSCoreDataService.m
//  SBSMovieDatabase
//
//  Created by Igor on 16/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import "SBSCoreDataService.h"


@implementation SBSCoreDataService

- (instancetype)initWithCoreDataStack:(SBSCoreDataStack *)coreDataStack
{
    self = [super init];
    if (self)
    {
        _mainContext = coreDataStack.persistentContainer.viewContext;
    }
    return  self;
}


- (FavouriteMovie *)findFavouriteMovieWithId:(nonnull NSString *)Id
{
    NSManagedObjectContext *context = self.mainContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"FavouriteMovie" inManagedObjectContext:context];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"movieID = %@", Id];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *objs = [context executeFetchRequest:request error:&error];
    FavouriteMovie *favMovie = [objs firstObject];
    if (error)
    {
        [NSException raise:@"No movie find" format:@"%@", [error localizedDescription]];
    }
    return favMovie;
}

- (FavouriteMovie *)saveDetailMovieToCoreData:(SBSDetailMovie *)detailMovie
{
    FavouriteMovie *favMovie = [NSEntityDescription insertNewObjectForEntityForName:@"FavouriteMovie" inManagedObjectContext:self.mainContext];
    favMovie.title = detailMovie.title;
    favMovie.duration = detailMovie.runtime;
    favMovie.genre = detailMovie.genre;
    favMovie.releaseDate = detailMovie.releaseDate;
    favMovie.movieID = detailMovie.movieID;
    favMovie.voteAverage = detailMovie.voteAverage;
    NSURL *posterURL = [SBSNetworkService createImageUrlForPath:detailMovie.posterPath];
    UIImage *posterImage = [[SBSImageCache sharedManager] cachedImageForURL: posterURL];
    NSData *posterData = UIImagePNGRepresentation(posterImage);
    favMovie.poster = posterData;
    NSError *error;
    if (![favMovie.managedObjectContext save:&error])
    {
        NSLog(@"Failed to save object");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    return favMovie;
}

- (void)deleteFavouriteMovieFromCoreData:(FavouriteMovie *)favMovie
{
    [self.mainContext deleteObject:favMovie];
    NSError *error;
    if (![self.mainContext save:&error])
    {
        NSLog(@"Failed to delete object");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
}

- (NSFetchedResultsController *)createFetchedResultsControllerWithRequestAndDelegate:(NSFetchRequest *)request delegate:(id<NSFetchedResultsControllerDelegate>)delegate
{
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.mainContext sectionNameKeyPath:nil cacheName:nil];
    fetchedResultsController.delegate = delegate;
    NSError *error = nil;
    if (![fetchedResultsController performFetch:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return fetchedResultsController;
}


- (NSFetchRequest *)createFetchRequest
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    request.sortDescriptors = @[sort];
    request.entity = [NSEntityDescription entityForName:@"FavouriteMovie"
                                 inManagedObjectContext:self.mainContext];
    return request;
}

@end
