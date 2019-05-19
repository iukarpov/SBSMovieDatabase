//
//  SBSCoreDataService.h
//  SBSMovieDatabase
//
//  Created by Igor on 16/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBSCoreDataProtocol.h"
#import "AppDelegate.h"
#import "SBSNetworkService.h"
#import "SBSImageCache.h"
#import "SBSCoreDataStack.h"


NS_ASSUME_NONNULL_BEGIN


@interface SBSCoreDataService : NSObject <SBSCoreDataProtocol>

@property (nonatomic, strong) NSManagedObjectContext *mainContext;

- (instancetype)initWithCoreDataStack:(SBSCoreDataStack *)coreDataStack;
- (NSFetchedResultsController *)createFetchedResultsControllerWithRequestAndDelegate:(NSFetchRequest *)request delegate:(id<NSFetchedResultsControllerDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
