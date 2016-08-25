//
//  EZCellModel.h
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EZCellModel : NSObject

@property (copy, nonatomic) NSString *contentStr;

@property (assign ,nonatomic) CGFloat cellHeigh;

@property (assign, nonatomic) CGFloat normalHeigh;
@property (assign, nonatomic) CGFloat expandHeigh;

@property (assign, nonatomic) NSInteger cellType;

- (instancetype)initWithContentString:(NSString *)string;


@end
