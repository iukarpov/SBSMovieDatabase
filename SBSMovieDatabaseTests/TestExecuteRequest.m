//
//  TestExecuteRequest.m
//  SBSMovieDatabaseTests
//
//  Created by Igor on 19/05/2019.
//  Copyright © 2019 Igor. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "../SBSMovieDatabase/Service/SBSNetworkService.h"
#import <OCMock.h>


@interface TestExecuteRequest : XCTestCase
@property (nonatomic, strong) SBSNetworkService *networkService;
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLRequest *inputRequest;
@property (nonatomic, strong) NSHTTPURLResponse *outputResponse;
@end

@implementation TestExecuteRequest

- (void)setUp
{
    [super setUp];
   // self.dataTask = OCMClassMock([NSURLSessionDataTask class]);
    self.networkService = OCMClassMock([SBSNetworkService class]);
    self.session = OCMClassMock([NSURLSession class]);
    self.inputRequest = OCMClassMock([NSURLRequest class]);
    OCMStub(ClassMethod([(id)self.session sharedSession])).andReturn(self.session);
}

- (void)tearDown
{
    [(id)self.session stopMocking];
    self.outputResponse = nil;
    self.inputRequest = nil;
    self.session = nil;
    [super tearDown];
}

- (void)testWhenErrorOccuersThenCompletionWithSameError
{
    NSError *givenError = [[NSError alloc] initWithDomain:@"Domain" code:0 userInfo:nil];
    OCMStub([self.session dataTaskWithRequest:[OCMArg any] completionHandler:([OCMArg invokeBlockWithArgs:@"", self.outputResponse, givenError, nil])]);
    void (^givenCompletion)(id  _Nonnull, NSError * _Nonnull) = ^void(id  _Nonnull responseData, NSError * _Nonnull resultError) {
        XCTAssertNil(responseData);
        XCTAssertEqual(resultError, givenError);
    };
    [self.networkService executeRequest:self.inputRequest withCompletionHandler:givenCompletion];
}

- (void)testWhenBadStatusCodeThenReturnWithoutCompletion
{
    OCMStub([self.outputResponse statusCode]).andReturn(403);
    OCMStub([self.session dataTaskWithRequest:[OCMArg any] completionHandler:([OCMArg checkWithBlock:^BOOL(id param) {
        void (^passedCompletion)(NSData *data, NSURLResponse *response, NSError *error) = param;
        passedCompletion(nil, self.outputResponse, nil);
        return YES;
    }])]);
    void (^givenCompletion)(id  _Nonnull, NSError * _Nonnull) = ^void(id  _Nonnull responseData, NSError * _Nonnull resultError) {
        XCTFail("Shouldn't be reached");
    };
    [self.networkService executeRequest:self.inputRequest withCompletionHandler:givenCompletion];
}

- (void)testWhenSuccesThenCompletionWithSameData
{
    NSData *givenData = [NSData data];
    OCMStub([self.outputResponse statusCode]).andReturn(200);
    OCMStub([self.session dataTaskWithRequest:[OCMArg any] completionHandler:([OCMArg checkWithBlock:^BOOL(id param) {
        void (^passedCompletion)(NSData *data, NSURLResponse *response, NSError *error) = param;
        passedCompletion(givenData, self.outputResponse, nil);
        return YES;
    }])]);
    void (^givenCompletion)(id  _Nonnull, NSError * _Nonnull) = ^void(id  _Nonnull responseData, NSError * _Nonnull resultError) {
        XCTAssertEqual(responseData, givenData);
    };
    [self.networkService executeRequest:self.inputRequest withCompletionHandler:givenCompletion];
}

@end

