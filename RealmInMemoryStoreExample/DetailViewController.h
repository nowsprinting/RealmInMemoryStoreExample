//
//  DetailViewController.h
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/21.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

