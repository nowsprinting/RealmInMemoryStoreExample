//
//  InMemoryStoreTests.m
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/22.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmployeeManager.h"

@interface InMemoryStoreTests : XCTestCase

@end

/**
 * RealmをIn memory storeで使用して、EmployeeTestsと同様のテストを行なう
 */
@implementation InMemoryStoreTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAddEmployee {
    RLMRealm *realm = [RLMRealm inMemoryRealmWithIdentifier:@"test"];
    
    [EmployeeManager addEmployeeWithName:@"John Cena" salary:2000000 realm:realm];
    
    NSArray *allObjects = [EmployeeManager fetchAllWithRealm:realm];
    XCTAssertEqual(1, allObjects.count);    //DBがクリアされていれば1件
    
    Employee *createdEmployee = [allObjects objectAtIndex:0];
    XCTAssertEqualObjects(@"John Cena", createdEmployee.name);
}

- (void)testFetchBySalary {
    RLMRealm *realm = [RLMRealm inMemoryRealmWithIdentifier:@"test"];

    [EmployeeManager addEmployeeWithName:@"John Cena" salary:2000000 realm:realm];
    [EmployeeManager addEmployeeWithName:@"Kurt Angle" salary:5000000 realm:realm];
    [EmployeeManager addEmployeeWithName:@"Booker T" salary:4999999 realm:realm];
    [EmployeeManager addEmployeeWithName:@"Hunter Hearst Helmsley" salary:8000000 realm:realm];
    
    NSArray *allObjects = [EmployeeManager fetchGreaterThanSalary:5000000 realm:realm];
    XCTAssertEqual(2, allObjects.count);

    Employee *employee = [allObjects objectAtIndex:0];
    XCTAssertEqualObjects(@"Hunter Hearst Helmsley", employee.name);  //Salary高い順にソートされているはず
    
    employee = [allObjects objectAtIndex:1];
    XCTAssertEqualObjects(@"Kurt Angle", employee.name);
}

- (void)testPerformance {
    [self measureBlock:^{
        RLMRealm *realm = [RLMRealm inMemoryRealmWithIdentifier:@"test"];
        
        for(NSInteger i=0; i<1000; i++){
            [EmployeeManager addEmployeeWithName:@"John Cena" salary:2000000 realm:realm];
        }
    }];
}

@end
