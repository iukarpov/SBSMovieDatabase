//
//  SBSCoreDataStack.m
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import "SBSCoreDataStack.h"


@interface SBSCoreDataStack ()

@end

@implementation SBSCoreDataStack

@synthesize persistentContainer = _persistentContainer;

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _persistentContainer = [self persistentContainer];
    }
    return self;
}

- (NSPersistentContainer *)persistentContainer
{
    @synchronized (self)
    {
        if (_persistentContainer == nil)
        {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Model"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
             {
                 if (error != nil)
                 {
                     NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                     abort();
                 }
             }];
        }
    }
    return _persistentContainer;
}

- (void)saveContext
{
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
    }
}

@end

