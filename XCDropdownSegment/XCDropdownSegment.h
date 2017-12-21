//
//  XCDropdownSegment.h
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/14.
//  Copyright © 2017年 樊小聪. All rights reserved.
//



/*
 *  备注：封装下拉列表 🐾
 */



#import <UIKit/UIKit.h>

#import "XCDropdownSegmentBar.h"


@class XCDropdownSegment;

/**
 *  数据源
 */
@protocol XCDropdownSegmentDataSource<NSObject>
@required
/**
 *  段头标题显示的文字
 */
- (NSArray<NSString *> *)titlesOfHeaderInDropdownSegment:(XCDropdownSegment *)dropdownSegment;

/**
 *  每段显示的文字数组
 */
- (NSArray<NSString *> *)dropdownSegment:(XCDropdownSegment *)dropdownSegment
                         titlesInSection:(NSInteger)section;
@end


/**
 *  代理
 */
@protocol XCDropdownSegmentDelegate<NSObject>
@optional
/**
 *  某南头部的回调
 */
- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment
    didSelectHeaderInSection:(NSInteger)section;

/**
 *  点击某一行的回调
 */
- (void)dropdownSegment:(XCDropdownSegment *)dropdownSegment
           didSelectRow:(NSInteger)row
              inSection:(NSInteger)section;
@end



@interface XCDropdownSegment : UIView

@property (weak, nonatomic) id<XCDropdownSegmentDataSource> dataSource;
@property (weak, nonatomic) id<XCDropdownSegmentDelegate> delegate;


/**
 *  更新配置
 */
- (void)updateConfigure:(void(^)(XCDropdownSegmentConfigure *confi))configure;

/**
 *  刷新数据
 */
- (void)reloadData;

/**
 *  隐藏
 */
- (void)close;

@end
