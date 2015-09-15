//
//  ViewController.m
//  quesston
//
//  Created by cdel_GL on 15/8/6.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "JisuanqiView.h"
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 随机色
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JisuanqiView *view = [[JisuanqiView alloc]init];
    [self.view addSubview:view];
    [view configJi];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.view.mas_left);
         make.right.equalTo(self.view.mas_right);
         make.bottom.equalTo(self.view.mas_bottom);
         make.height.equalTo(@305);
        
    }];
}

@end
