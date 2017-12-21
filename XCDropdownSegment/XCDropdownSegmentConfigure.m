//
//  XCDropdownSegmentConfigure.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/15.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegmentConfigure.h"
#import "XCDropdownSegmentHeader.h"


@implementation XCDropdownSegmentConfigure

+ (instancetype)defaultConfigure
{
    XCDropdownSegmentConfigure *config = [[XCDropdownSegmentConfigure alloc] init];
    
    config.sectionHeight = 50;
    config.rowHeight     = 50;
    config.arrowUpImage   = ImageNamed(@"icon_arrow_up");
    config.arrowDownImage = ImageNamed(@"icon_arrow_down");
    config.checkImage = ImageNamed(@"icon_check");
    
    config.headerTitleColor = RGBA_COLOR(88, 88, 88, 1);
    config.headerSelectedTitleColor = [UIColor orangeColor];
    config.headerTitleFontSize = 15;
    
    config.rowTitleColor = [UIColor blackColor];
    config.rowSelectedTitleColor = [UIColor orangeColor];
    config.rowTitleFontSize = 15;
    
    return config;
}

static inline UIImage *ImageNamed(NSString *imageName)
{
    NSInteger scale = [UIScreen mainScreen].scale;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:NSClassFromString(@"XCDropdownSegment")];
    NSString *bundleName = @"XCDropdownSegment.bundle";
    NSString *imagePath  = [currentBundle pathForResource: [NSString stringWithFormat:@"%@@%zdx", imageName, scale] ofType:@"png" inDirectory:bundleName];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
