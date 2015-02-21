//
//  EmployeeManager.m
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/22.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import "EmployeeManager.h"

@implementation EmployeeManager

/**
 * Realmインスタンスを指定して従業員オブジェクトを全件取得する
 * <p/>
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 */
+ (NSArray *)fetchAllWithRealm:(RLMRealm *)realm{
    //default realmでなく、引数で渡されたRLMRealmインスタンスから抽出
    RLMResults *results = [[Employee allObjectsInRealm:realm] sortedResultsUsingProperty:@"addDate" ascending:NO];
    
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i=0; i<results.count; i++){
        [array addObject:[results objectAtIndex:i]];
    }
    return array;
}

/**
 * 従業員オブジェクトを全件取得する
 */
+ (NSArray *)fetchAll{
    return [EmployeeManager fetchAllWithRealm:[RLMRealm defaultRealm]];
}


/**
 * 指定額より給与が多い従業員オブジェクトを取得する
 * <p/>
 * @param salary 指定給与額
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 */
+ (NSArray *)fetchGreaterThanSalary:(float)salary realm:(RLMRealm *)realm{
    //default realmでなく、引数で渡されたRLMRealmインスタンスから抽出
    RLMResults *results = [[Employee objectsInRealm:realm where:@"salary >= %f", salary]
                           sortedResultsUsingProperty:@"salary" ascending:NO];
    
    NSMutableArray *array = [NSMutableArray array];
    for(NSInteger i=0; i<results.count; i++){
        [array addObject:[results objectAtIndex:i]];
    }
    return array;
}

/**
 * 指定額より給与が多い従業員オブジェクトを取得する
 * <p/>
 * @param salary 指定給与額
 */
+ (NSArray *)fetchGreaterThanSalary:(float)salary{
    return [EmployeeManager fetchGreaterThanSalary:salary realm:[RLMRealm defaultRealm]];
}


/**
 * 従業員インスタンスを生成・追加する
 * <p/>
 * @param name 氏名
 * @param salary 給与
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name salary:(float)salary realm:(RLMRealm *)realm{
    Employee *newEmployee = [[Employee alloc] init];
    newEmployee.name = name;
    newEmployee.salary = salary;
    newEmployee.addDate = [NSDate date];
    
    [realm beginWriteTransaction];
    [realm addObject:newEmployee];
    [realm commitWriteTransaction];
    
    return newEmployee;
}

/**
 * 従業員インスタンスを生成・defaultRealmに追加する
 * <p/>
 * @param name 氏名
 * @param salary 給与
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name salary:(float)salary{
    return [EmployeeManager addEmployeeWithName:name salary:salary realm:[RLMRealm defaultRealm]];
}

/**
 * 従業員インスタンスを生成・defaultRealmに追加する
 * <p/>
 * @param name 氏名
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name{
    return [EmployeeManager addEmployeeWithName:name salary:600000 realm:[RLMRealm defaultRealm]];
}

@end
