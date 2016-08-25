//
//  sgmentView.m
//  EZProduct
//
//  Created by 罗邦杰 on 16/8/25.
//  Copyright © 2016年 罗邦杰. All rights reserved.
//

#import "sgmentView.h"
#define titleHeight 40
#define titleWidth 375.0/2

@interface sgmentView ()<UIScrollViewDelegate>

@property (strong, nonatomic) NSArray<UIViewController *> *titles;
@property (strong, nonatomic) UIScrollView *mainScrollView;

@property (strong, nonatomic) NSMutableArray<UIButton *> *btnArray;

@property (strong, nonatomic) UIView *sliderView;

@property (assign, nonatomic) NSInteger currentIndex;

@property (strong, nonatomic) UIButton *currentSelectBtn;

@end

@implementation sgmentView

- (instancetype)initWithFrame:(CGRect)frame wihtTitle:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if(self){
        _titles = [[NSArray<UIViewController *> alloc]initWithArray:titles];
        [self initWithTitleView];
        [self initWithScrollView];
    }
    return self;
}

- (void)initWithTitleView {
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 40)];
    
    backgroundView.backgroundColor = [UIColor grayColor];
    
    _btnArray = [NSMutableArray<UIButton *> array];
    for (int i = 0; i < _titles.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*titleWidth, 0, titleWidth, titleHeight);
        [btn setTitle:self.titles[i].title forState:UIControlStateNormal];
        btn.tag = i;
        [btn setBackgroundColor:[UIColor grayColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [backgroundView addSubview:btn];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            _currentSelectBtn = btn;
            btn.selected = YES;
        }
        [_btnArray addObject:btn];
    }
    
    _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, titleHeight-1, titleWidth, 1)];
    _sliderView.backgroundColor = [UIColor blackColor];
    [backgroundView addSubview:self.sliderView];
    
    [self addSubview:backgroundView];
    
}

- (void)initWithScrollView {
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, titleHeight, 375, 667-20-titleHeight)];
    
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.contentSize = CGSizeMake(_titles.count*375, 0);
    
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.bounces = NO;
    _mainScrollView.delegate = self;
    
    for (int i = 0; i < _titles.count; i++) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 60)];
        label.text = self.titles[i].title;
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.center = CGPointMake(_mainScrollView.frame.size.width/2, _mainScrollView.frame.size.height/2);
        view = self.titles[i].view;
        view.frame = CGRectMake(i*375, 0, 375, 667-20-titleHeight);

        [_mainScrollView addSubview:view];
    }
    
    [self addSubview:self.mainScrollView];
    
}

- (void)clickBtn:(UIButton *)sender {
    
    [UIView animateWithDuration:0.2f animations:^{
        _mainScrollView.contentOffset = CGPointMake(sender.tag*375, 0);
        _sliderView.frame = CGRectMake(sender.tag*titleWidth, titleHeight-1, titleWidth, 1);
        _currentSelectBtn.selected = NO;
        _currentSelectBtn = sender;
        _currentSelectBtn.selected = YES;
    } completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _currentIndex = (NSInteger)(_mainScrollView.contentOffset.x / 375+0.5);
    if (_currentIndex != self.currentSelectBtn.tag) {
        [UIView animateWithDuration:0.2f animations:^{
            _sliderView.frame = CGRectMake(self.btnArray[self.currentIndex].tag*titleWidth, titleHeight-1, titleWidth, 1);
            _currentSelectBtn.selected = NO;
            _currentSelectBtn = self.btnArray[self.currentIndex];
            _currentSelectBtn.selected = YES;
        } completion:nil];
        _currentSelectBtn = self.btnArray[self.currentIndex];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
