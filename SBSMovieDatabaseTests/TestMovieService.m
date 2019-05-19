//
//  TestMovieService.m
//  SBSMovieDatabaseTests
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "../SBSMovieDatabase/Service/SBSMovieService.h"

@interface TestMovieService : XCTestCase
@property (nonatomic, strong) SBSMovieService *movieService;
@end

@implementation TestMovieService

- (void)setUp
{
    [super setUp];
    self.movieService = OCMPartialMock([SBSMovieService new]);
}

- (void)tearDown
{
    self.movieService = nil;
    [super tearDown];
}



@end
