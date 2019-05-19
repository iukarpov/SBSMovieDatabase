//
//  SBSCoreDataStack.h
//  SBSMovieDatabase
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;


NS_ASSUME_NONNULL_BEGIN

@interface SBSCoreDataStack : NSObject
@property(nonatomic, strong) NSPersistentContainer *persistentContainer;
@end

NS_ASSUME_NONNULL_END
