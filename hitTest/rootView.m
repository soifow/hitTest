//
//  rootView.m
//  hitTest
//
//  Created by soifow on 15/3/10.
//  Copyright (c) 2015年 soifow. All rights reserved.
//

#import "rootView.h"

@interface rootView ()

@property (nonatomic, strong) UIButton *testBtn;
@property (nonatomic, strong) UIButton *hitBtn;

@end


@implementation rootView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.testBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 95, 150, 30)];
        _testBtn.backgroundColor = [UIColor grayColor];
        [_testBtn setTitle:@"click to move left" forState:UIControlStateNormal];
        [_testBtn addTarget:self action:@selector(testBtnInvoked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_testBtn];
        
//        self.hitBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.frame), 100, 150, 30)];
        self.hitBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 150, 30)];
        _hitBtn.backgroundColor = [UIColor blueColor];
        [_hitBtn setTitle:@"click to move right" forState:UIControlStateNormal];
        [_hitBtn addTarget:self action:@selector(hitBtnInvoked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_hitBtn];
    }
    
    return self;
}

- (void)testBtnInvoked:(id)sender {
    CGRect frame = self.frame;
    frame.origin.x -= 200;
    self.frame = frame;
}

- (void)hitBtnInvoked:(id)sender {
    CGRect frame = self.frame;
    frame.origin.x += 200;
    self.frame = frame;
}

//打开此注释可以让button :click to move right 在view外面的部分也能响应方法，可以更加细致的定义return yes的判断
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    return YES;
//}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    CGPoint buttonPoint = [_testBtn convertPoint:point fromView:self];
    if ([_testBtn pointInside:buttonPoint withEvent:event]) {
        return _testBtn;
    }
    
    return result;
}

@end
