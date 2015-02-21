//
//  EmployeeManager.h
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/22.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <Realm/Realm.h>
#import "Employee.h"

@interface EmployeeManager : NSObject

/**
 * Realmインスタンスを指定して従業員オブジェクトを全件取得する
 * <p/>
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 */
+ (NSArray *)fetchAllWithRealm:(RLMRealm *)realm;

/**
 * 従業員オブジェクトを全件取得する
 */
+ (NSArray *)fetchAll;


/**
 * 指定額より給与が多い従業員オブジェクトを取得する
 * <p/>
 * @param salary 指定給与額
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 */
+ (NSArray *)fetchGreaterThanSalary:(float)salary realm:(RLMRealm *)realm;

/**
 * 指定額より給与が多い従業員オブジェクトを取得する
 * <p/>
 * @param salary 指定給与額
 */
+ (NSArray *)fetchGreaterThanSalary:(float)salary;


/**
 * 従業員インスタンスを生成・追加する
 * <p/>
 * @param name 氏名
 * @param salary 給与
 * @param realm Realmインスタンス（省略時はdefaultRealm）
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name salary:(float)salary realm:(RLMRealm *)realm;

/**
 * 従業員インスタンスを生成・defaultRealmに追加する
 * <p/>
 * @param name 氏名
 * @param salary 給与
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name salary:(float)salary;

/**
 * 従業員インスタンスを生成・defaultRealmに追加する
 * <p/>
 * @param name 氏名
 * @return 生成・追加された従業員インスタンス
 */
+ (Employee *)addEmployeeWithName:(NSString *)name;

@end
