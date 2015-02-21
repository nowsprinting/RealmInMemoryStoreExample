//
//  Employee.h
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/22.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <Realm/Realm.h>

@interface Employee : RLMObject

@property NSString *name;
@property float salary;
@property NSDate *addDate;

@end

RLM_ARRAY_TYPE(Employee);
