//
//  ContatoDAOTest.m
//  ContatosIP67
//
//  Created by Adriano Negrão on 22/07/16.
//  Copyright © 2016 Caelum. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ContatoDAO.h"

@interface ContatoDAOTest : XCTestCase

@end

@implementation ContatoDAOTest

ContatoDAO* contatoDAO;

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    contatoDAO = [ContatoDAO new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertNotNil(contatoDAO);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
