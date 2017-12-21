//
//  XCDropdownSegmentBar.h
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIView+XCDropdownSegment.h"
#import "XCDropdownSegmentHeader.h"
#import "XCDropdownSegmentConfigure.h"


@interface XCDropdownSegmentButton : UIButton

@end


/* 🐖 *******************🐖 XCDropdownSegmentBar 🐖 *********************  🐖 */

@interface XCDropdownSegmentBar : UIView

/// 选中item
@property (weak, nonatomic, readonly) XCDropdownSegmentButton *selectedItem;
/** 👀 配置 👀 */ 
@property (strong, nonatomic) XCDropdownSegmentConfigure *configure;
/** 👀 标题数组 👀 */
@property (strong, nonatomic) NSArray<NSString *> *titles;
/** 👀 点击 item 的回调 👀 */
@property (copy, nonatomic) void(^didClickItemCallBack)(XCDropdownSegmentBar *headerView, XCDropdownSegmentButton *item, NSInteger index);

@end
