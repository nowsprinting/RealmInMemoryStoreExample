//
//  DetailViewController.m
//  RealmInMemoryStoreExample
//
//  Created by Koji Hasegawa on 2015/02/21.
//  Copyright (c) 2015年 Koji Hasegawa. All rights reserved.
//

#import "DetailViewController.h"
#import "Employee.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.nameLabel.text = ((Employee*)self.detailItem).name;
        self.dateLabel.text = [((Employee*)self.detailItem).addDate description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
