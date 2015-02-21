//
//  EmployeeTests.m
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/22.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmployeeManager.h"

@interface EmployeeTests : XCTestCase

@end

@implementation EmployeeTests

- (void)setUp {
    [super setUp];
    
    //default realmをテスト専用のものに置き換える（テスト対象アプリのrealmファイルに干渉させないため）
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *realmPath = [docPath stringByAppendingPathComponent:@"test.realm"];
    [RLMRealm setDefaultRealmPath:realmPath];
    
    //内容をクリア
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteAllObjects];
    [realm commitWriteTransaction];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAddEmployee {
    [EmployeeManager addEmployeeWithName:@"John Cena"];
    
    NSArray *allObjects = [EmployeeManager fetchAll];
    XCTAssertEqual(1, allObjects.count);    //DBがクリアされていれば1件
    
    Employee *createdEmployee = [allObjects objectAtIndex:0];
    XCTAssertEqualObjects(@"John Cena", createdEmployee.name);
}

- (void)testFetchBySalary {
    [EmployeeManager addEmployeeWithName:@"John Cena" salary:2000000];
    [EmployeeManager addEmployeeWithName:@"Kurt Angle" salary:5000000];
    [EmployeeManager addEmployeeWithName:@"Booker T" salary:4999999];
    [EmployeeManager addEmployeeWithName:@"Hunter Hearst Helmsley" salary:8000000];
    
    NSArray *allObjects = [EmployeeManager fetchGreaterThanSalary:5000000];
    XCTAssertEqual(2, allObjects.count);

    Employee *employee = [allObjects objectAtIndex:0];
    XCTAssertEqualObjects(@"Hunter Hearst Helmsley", employee.name);  //Salary高い順にソートされているはず
    
    employee = [allObjects objectAtIndex:1];
    XCTAssertEqualObjects(@"Kurt Angle", employee.name);
}

- (void)testPerformance {
    [self measureBlock:^{
        for(NSInteger i=0; i<1000; i++){
            [EmployeeManager addEmployeeWithName:@"John Cena"];
        }
    }];
}

@end
