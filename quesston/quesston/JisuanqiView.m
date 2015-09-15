//
//  JisuanqiView.m
//  quesston
//
//  Created by cdel_GL on 15/9/7.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "JisuanqiView.h"
@interface JisuanqiView()
@property (nonatomic,strong)NSMutableArray *arrayM;
@end

@implementation JisuanqiView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        _arrayM = [NSMutableArray arrayWithCapacity:5];
        self.backgroundColor = [UIColor blackColor];
        
        UIButton *firstBtn = nil;
        UIButton *lastBtn = nil;
        CGFloat height = 50;        //高度
        CGFloat margin = 1;         //行间距
        CGFloat padding = 1;        //列间距
        int count = 24;             //总数
        int x = 4;                  //每行几个
        NSArray *array = @[@"MC",@"MR",@"←",@"C",@"MS",@"M+",@"√",@"÷",@"7",@"8",@"9",@"x",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+",@"0",@".",@"=",@"="];
        
        for (int i = 0; i<count; i++) {
            int row = i / x;
            int col = i % x;
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_arrayM addObject:btn];
            [btn setTitle:array[i] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor grayColor];
            [self addSubview:btn];
            if (col == 0) {
                firstBtn = btn;
                lastBtn = nil;
            }
            
            //行
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastBtn?lastBtn.mas_right:self.mas_left).offset(margin);
                make.height.equalTo(@(height));
                make.width.equalTo(([UIScreen mainScreen].bounds.size.width-margin *(x + 1))/4);
                make.top.equalTo(@( row * (height + padding)));
                
            }];
            lastBtn = btn;
            
            if (i ==21) {
                UIButton *btn = self.arrayM[20];
                CGFloat width =[UIScreen mainScreen].bounds.size.width - (([UIScreen mainScreen].bounds.size.width-margin *(x + 1))/4) *2 -4;
                [btn mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.width.equalTo(width );
                }];
                [btn setTitle:@"0" forState:UIControlStateNormal];
            }
        }
        
        [self.arrayM[23] removeFromSuperview];
        
      
    }
    return self;
}

- (void)setHeight:(CGFloat)height
{
    _height = height;
    for (int i = 0 ; i<self.arrayM.count; i++) {
         UIButton *btn = self.arrayM[i];
        [btn mas_updateConstraints:^(MASConstraintMaker *make) {
             make.height.equalTo(@(height));
            int row = i / 4;
            make.top.equalTo(@(row * (height + 1)));
        }];
    }
    
}

- (void)configJi
{
    NSMutableArray *numsArray = [NSMutableArray array];
    for (int i = 0; i < self.arrayM.count; i++) {
        if (i ==8 ||i ==9 ||i ==10 ||i ==12 ||i ==13 ||i ==14 ||i ==16 ||i ==17 ||i ==18 ||i ==20 ) {
            [numsArray addObject:self.arrayM[i]];
            UIButton *btn = self.arrayM[i];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}

//数字与运算符显示
- (void)btnClick:(UIButton *)sender {
    NSLog(@"%@",sender.currentTitle);
}

@end
