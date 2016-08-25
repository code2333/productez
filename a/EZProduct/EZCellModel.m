

//
//  EZCellModel.m
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import "EZCellModel.h"

@implementation EZCellModel

- (instancetype)initWithContentString:(NSString *)string {
    self = [super init];
    if (self) {
        
        self.contentStr = string;
        self.cellType = 0;
        CGRect rect1 = [string boundingRectWithSize:CGSizeMake(375-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        
        CGRect rect2 = [@"one" boundingRectWithSize:CGSizeMake(375-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
        
        
        self.expandHeigh = rect1.size.height + 20;
        
        CGFloat normalTextHeight = rect1.size.height >= 4 * rect2.size.height ? 4 * rect2.size.height : rect1.size.height;
        self.normalHeigh = normalTextHeight + 20;
        
        self.cellHeigh = self.normalHeigh;
        
        
    }
    return self;
}

@end
