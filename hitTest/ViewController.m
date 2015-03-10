//
//  ViewController.m
//  hitTest
//
//  Created by soifow on 15/3/10.
//  Copyright (c) 2015年 soifow. All rights reserved.
//

#import "ViewController.h"
#import "rootView.h"

@interface ViewController ()

@property (nonatomic, strong) rootView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.testView = [[rootView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.testView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
