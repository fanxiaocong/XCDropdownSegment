//
//  XCDropdownSegmentBar.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegmentBar.h"


@implementation XCDropdownSegmentButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat textW = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}].width;    // 文字宽度
    CGFloat imgW = TOP_BUTTON_IMG_WIDTH; // 图片宽度
    CGFloat marginX = TOP_BUTTON_IMG_TITLE_MARGIN;  // 图片与文字的间隙
    
    self.titleLabel.left = (self.width - (textW + imgW + marginX)) * 0.5;
    self.imageView.left  = CGRectGetMaxX(self.titleLabel.frame) + 5;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

- (void)setHighlighted:(BOOL)highlighted {}

@end


/* 🐖 *******************🐖 XCDropdownSegmentBar 🐖 *********************  🐖 */

@interface XCDropdownSegmentBar ()

/// items
@property (strong, nonatomic) NSMutableArray<XCDropdownSegmentButton *> *items;
/// 分隔线
@property (strong, nonatomic) NSMutableArray<UIView *> *lines;

@end


@implementation XCDropdownSegmentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        /// 配置默认参数
        [self setupDefault];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    /// 设置 item 的 frame
    CGFloat itemW = self.width / MAX(self.items.count, 1);
    CGFloat itemH = self.height;
    CGFloat itemY = 0;
    
    for (NSInteger i = 0; i < self.items.count; i ++)
    {
        XCDropdownSegmentButton *item = self.items[i];
        
        CGFloat itemX = itemW * i;
        item.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
    
    
    /// 设置 分隔线 的 frame
    for (NSInteger i = 0; i < self.lines.count; i ++)
    {
        UIView *lineView = self.lines[i];
        
        lineView.width   = 0.5;
        lineView.height  = 20;
        lineView.centerX = itemW * (i + 1);
        lineView.centerY = self.height * 0.5;
    }
}

/**
 *  配置默认参数
 */
- (void)setupDefault
{
    _configure  = [XCDropdownSegmentConfigure defaultConfigure];
    _titles = @[@"Hello world"];
    _items = [NSMutableArray array];
    _lines = [NSMutableArray array];
    
    /// 设置 UI
    [self setupUI];
}

- (void)setTitles:(NSArray<NSString *> *)titles
{
    _titles = titles;
    
    /// 设置 UI
    [self setupUI];
}

- (void)setConfigure:(XCDropdownSegmentConfigure *)configure
{
    _configure = configure;
    
    /// 重新更新 item
    for (XCDropdownSegmentButton *item in self.items) {
        [self updateConfigureWithItem:item];
    }
}

#pragma mark - 🎬 👀 Action Method 👀

/**
 *  点击 item 的回调
 */
- (void)didClickItemAction:(XCDropdownSegmentButton *)item
{
    if (_selectedItem != item) {
        _selectedItem.selected = NO;
    }
    
    item.selected = !item.isSelected;
    _selectedItem = item;
    
    /// 点击 item 的回调
    if (self.didClickItemCallBack) {
        self.didClickItemCallBack(self, item, (item.tag-100));
    }
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  设置UI
 */
- (void)setupUI
{
    /// 移除所有子视图
    [self.items removeAllObjects];
    [self.lines removeAllObjects];
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger count = MAX(self.titles.count, 1);
    
    /// 重新添加 items
    for (NSInteger i = 0; i < count; i ++)
    {
        XCDropdownSegmentButton *item = [XCDropdownSegmentButton buttonWithType:UIButtonTypeCustom];
        item.tag = 100 + i;
        [item setTitle:self.titles[i] forState:UIControlStateNormal];
        // 添加进数组
        [self.items addObject:item];
        // 添加事件
        [item addTarget:self action:@selector(didClickItemAction:) forControlEvents:UIControlEventTouchUpInside];
        // 更新配置
        [self updateConfigureWithItem:item];
        // 添加到视图
        [self addSubview:item];
    }
    
    /// 添加分隔线
    NSInteger lineCount = count - 1;
    for (NSInteger i = 0; i < lineCount; i ++)
    {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = SEPERATOR_LINE_COLOR;
        // 添加进数组
        [self.lines addObject:lineView];
        // 添加到视图
        [self addSubview:lineView];
    }
}

/**
 *  更新 item 的配置
 */
- (void)updateConfigureWithItem:(XCDropdownSegmentButton *)item
{
    [item setImage:self.configure.arrowDownImage forState:UIControlStateNormal];
    [item setImage:self.configure.arrowUpImage forState:UIControlStateSelected];
    [item setTitleColor:self.configure.headerTitleColor forState:UIControlStateNormal];
    [item setTitleColor:self.configure.headerSelectedTitleColor forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:self.configure.headerTitleFontSize];
}

@end
