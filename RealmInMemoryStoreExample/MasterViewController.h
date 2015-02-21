//
//  MasterViewController.h
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/21.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

