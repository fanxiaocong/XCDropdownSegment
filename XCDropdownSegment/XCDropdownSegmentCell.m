//
//  XCDropdownSegmentCell.m
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCDropdownSegmentCell.h"


static NSString *const cellIdentifier = @"XCDropdownSegmentCell";

@implementation XCDropdownSegmentCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    XCDropdownSegmentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[[NSBundle bundleForClass:[self class]]loadNibNamed:cellIdentifier owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.checkImgView.hidden = !selected;
}

@end
