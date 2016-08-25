//
//  ViewController.m
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import "ViewController.h"
#import "sgmentView.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OneViewController *one = [[OneViewController alloc]init];
    TwoViewController *two = [[TwoViewController alloc]init];
    one.title = @"段子";
    two.title = @"还没想好做什么。。";
    
    sgmentView *sg = [[sgmentView alloc]initWithFrame:CGRectMake(0, 20, 375, 776) wihtTitle:@[one,two]];
    [self.view addSubview:sg];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
