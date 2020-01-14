//
//  XCTestViewController.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/21.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCTestViewController.h"

#import "XCDropdownSegment.h"
#import "XCDropdownSegmentHeader.h"

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

@interface XCTestViewController ()<XCDropdownSegmentDataSource, XCDropdownSegmentDelegate>

@end

@implementation XCTestViewController

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
    XCDropdownSegment *segment = [[XCDropdownSegment alloc] initWithFrame:CGRectMake(0, 150, SCREEN_WIDTH, 50)];
    segment.dataSource = self;
    segment.delegate   = self;
    [self.view addSubview:segment];
    
    if (1 == self.sectionCount)
    {
        [segment updateConfigure:^(XCDropdownSegmentConfigure *confi) {
            confi.headerSelectedTitleColor = [UIColor redColor];
            confi.rowHeight = 40;
        }];
    }
}

#pragma mark - 🎬 👀 Action Method 👀

- (IBAction)didClickButtonAction:(id)sender
{
    NSLog(@"点击了按钮");
}

#pragma mark - 📕 👀 XCDropdownSegmentDataSource 👀

- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment
{
    if (2 == self.sectionCount) {
        return @[@"第一段", @"第二段"];
    }
    
    if (3 == self.sectionCount) {
        return @[@"第一段", @"第二段", @"第三段"];
    }
    
    return @[@"第一段"];
}

- (NSArray<NSString *> *)dropdownSegment:(XCDropdownSegment *)dropdownSegment titlesInSection:(NSInteger)section
{
    if (0 == section)   return @[@"一：001", @"一：002", @"一：003"];
    
    if (1 == section)   return @[
                                 @"二：001",
                                 @"二：002",
                                 @"二：003",
                                 @"二：004",
                                 @"二：005",
                                 @"二：006",
                                 @"二：007"
                                 ];
    return @[
             @"三：001",
             @"三：002",
             @"三：003",
             @"三：004",
             @"三：005"
             ];
}

#pragma mark - 💉 👀 XCDropdownSegmentDelegate 👀

- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment didSelectHeaderInSection:(NSInteger)section
{
    NSLog(@"点击了第 %zi 段", section);
}

- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment didSelectRow:(NSInteger)row inSection:(NSInteger)section
{
    NSLog(@"点击了第 %zi 段的第 %zi 行", section, row);
}

@end
