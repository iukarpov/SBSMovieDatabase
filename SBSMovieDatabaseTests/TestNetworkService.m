//
//  TestNetworkService.m
//  SBSMovieDatabaseTests
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../SBSMovieDatabase/Service/SBSNetworkService.h"
#import <OCMock.h>


@interface TestNetworkService : XCTestCase
@property (nonatomic, strong) SBSNetworkService *networkService;
@end

@implementation TestNetworkService

- (void)setUp
{
    self.networkService = OCMPartialMock([SBSNetworkService new]);
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testCreateImageUrlForPath_ValidUrl
{
    NSString *sourcePath = @"/12345.jpg";
    NSURL *result = [SBSNetworkService createImageUrlForPath:sourcePath];
    XCTAssertNotNil(result);
    XCTAssertTrue([[result absoluteString] isEqualToString :@"https://image.tmdb.org/t/p/w500/12345.jpg"]);
}

- (void)testCreateUrlWithPathWithQueryItems_ValidUrl
{
    NSString *pathInput = @"/12345";
    NSArray<NSURLQueryItem *> *queryInput = @[[NSURLQueryItem queryItemWithName:@"test1" value:@"value1"]];
    NSURL *result = [self.networkService createUrlWithPath:pathInput withQueryItems:queryInput];
    XCTAssertNotNil(result);
    XCTAssertTrue([[result absoluteString] isEqualToString:@"https://api.themoviedb.org/12345?test1=value1"]);
}

- (void)testCreateUrlWithPathWithQueryItems_Nil
{
    NSString *pathInput = nil;
    NSArray<NSURLQueryItem *> *queryInput = nil;
    NSURL *result = [self.networkService createUrlWithPath:pathInput withQueryItems:queryInput];
    XCTAssertNil(result);
}

- (void)testCreateRequestWithUrl
{
    NSString *inputMethod = @"GET";
    NSURL *inputUrl = [NSURL URLWithString: @"https://api.themoviedb.org"];
    NSMutableURLRequest *result =  [self.networkService createRequestWithMethod:inputMethod forURL:inputUrl];
    XCTAssertNotNil(result);
}

//- (void)testCreateImageUrlForPath_Nil
//{
//    NSString *sourcePath = ;
//    NSURL *result = [SBSNetworkService createImageUrlForPath:sourcePath];
//    XCTAssertNil(result);
//}

@end
