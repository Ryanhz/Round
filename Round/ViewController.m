//
//  ViewController.m
//  Round
//
//  Created by hzf on 16/8/23.
//  Copyright © 2016年 hzf. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(1, dispatch_get_main_queue(), ^{
        TableViewController *tableView = [[TableViewController alloc] init];
        [self presentViewController:tableView animated:NO completion:^{
            
        }];
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
