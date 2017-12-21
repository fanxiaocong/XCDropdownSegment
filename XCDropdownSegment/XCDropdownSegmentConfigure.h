//
//  XCDropdownSegmentConfigure.h
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/15.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCDropdownSegmentConfigure : NSObject

/** 👀 段头高：默认 50 👀 */
@property (assign, nonatomic) CGFloat sectionHeight;
/** 👀 行高：默认 50 👀 */
@property (assign, nonatomic) CGFloat rowHeight;
/** 👀 指示箭头图片上 ⬆︎ 👀 */
@property (strong, nonatomic) UIImage *arrowUpImage;
/** 👀 指示箭头图片下 ⬇︎ 👀 */
@property (strong, nonatomic) UIImage *arrowDownImage;
/** 👀 选中的图片 👀 */
@property (strong, nonatomic) UIImage *checkImage;

/** 👀 头部标题文字大小：默认 15 👀 */
@property (assign, nonatomic) CGFloat headerTitleFontSize;
/** 👀 头部标题颜色：默认 blackColor 👀 */
@property (strong, nonatomic) UIColor *headerTitleColor;
/** 👀 头部选中后的标题颜色：默认 orangeColor 👀 */
@property (strong, nonatomic) UIColor *headerSelectedTitleColor;

/** 👀 每行文字的字体大小：默认 15  👀 */
@property (assign, nonatomic) CGFloat rowTitleFontSize;
/** 👀 每行文字的颜色：默认 blackColor 👀 */
@property (strong, nonatomic) UIColor *rowTitleColor;
/** 👀 每行文字选中后的标题颜色：默认 orangeColor 👀 */
@property (strong, nonatomic) UIColor *rowSelectedTitleColor;


+ (instancetype)defaultConfigure;

@end
