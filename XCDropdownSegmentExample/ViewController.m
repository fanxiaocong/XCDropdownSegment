//
//  ViewController.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/14.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"

#import "XCDropdownSegment.h"
#import "UIView+XCDropdownSegment.h"


@interface ViewController ()<XCDropdownSegmentDataSource>

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /// 设置 UI
    [self setupUI];
}

/**
 *  设置 UI
 */
- (void)setupUI
{
    XCDropdownSegment *segment = [[XCDropdownSegment alloc] initWithFrame:CGRectMake(0, 100, self.view.width, self.view.height - 100)];
    segment.dataSource = self;
    [self.view addSubview:segment];
}

#pragma mark - 📕 👀 XCDropdownSegmentDataSource 👀

- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment
{
    return @[@"第一段", @"第二段"];
}

- (NSArray<NSString *> *)dropdownSegment:(XCDropdownSegment *)dropdownSegment titlesInSection:(NSInteger)section
{
    if (0 == section)   return @[@"一：001", @"一：002", @"一：003"];
    
    return @[
             @"二：001",
             @"二：002",
             @"二：003",
             @"二：004",
             @"二：005",
             @"二：006",
             @"二：007"
             ];
}


@end
