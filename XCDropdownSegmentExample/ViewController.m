//
//  ViewController.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/14.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCTestViewController.h"



@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 🚀 ⛳️ Navigation Jump ⛳️

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    XCTestViewController *vc = segue.destinationViewController;
    vc.sectionCount = [segue.identifier integerValue];
}

@end
