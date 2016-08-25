//
//  EZTableViewCell.h
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZCellModel.h"

typedef NS_ENUM(NSInteger, EZShowCellTextType) {
    GGShowCellTextTypeNormal,
    GGShowCellTextTypeExpend,
};

@interface EZTableViewCell : UITableViewCell
@property (strong, nonatomic) EZCellModel *model;

@property (assign, nonatomic) EZShowCellTextType cellType;
@property (strong, nonatomic) UILabel *flagLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)clickCell;
@end
