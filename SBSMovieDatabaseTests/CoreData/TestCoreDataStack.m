//
//  TestCoreDataStack.m
//  SBSMovieDatabaseTests
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "SBSCoreDataStack.h"

@interface TestCoreDataStack : SBSCoreDataStack

@end

@implementation TestCoreDataStack

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        NSPersistentStoreDescription *persistentStoreDescription = [NSPersistentStoreDescription new];
        persistentStoreDescription.type = NSInMemoryStoreType;
        NSPersistentContainer *container = [[NSPersistentContainer alloc] initWithName:@"Model"];
        container.persistentStoreDescriptions = @[persistentStoreDescription];
        [container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
         {
             if (error != nil)
             {
                 NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                 abort();
             }
         }];
        self.persistentContainer = container;
    }
    return self;
}

@end
