//
//  ViewController.m
//  23.扩大按钮的点击区域
//
//  Created by 梁森 on 2020/6/20.
//  Copyright © 2020 梁森. All rights reserved.
//

#import "ViewController.h"

#import "UIButton+changeEffectiveArea.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn setTitle:@"点我" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.clickArea = @"2";
}

- (void)clickBtn{
    NSLog(@"点击按钮...");
}


@end
