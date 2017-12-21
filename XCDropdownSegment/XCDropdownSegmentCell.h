//
//  XCDropdownSegmentCell.h
//  XCDropdownSegmentExample
//
//  Created by 樊小聪 on 2017/12/20.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCDropdownSegmentCell : UITableViewCell

/** 👀 标题LB 👀 */
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
/** 👀 选中图片 👀 */
@property (weak, nonatomic) IBOutlet UIImageView *checkImgView;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
