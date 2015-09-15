//
//  MYWebView.m
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "MYWebView.h"

@implementation MYWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //        self.backgroundColor = [UIColor clearColor];
        self.scrollView.scrollEnabled = NO;
        UIButton *questionNoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _questionNoBtn = questionNoBtn;
        [questionNoBtn setBackgroundImage:[UIImage imageNamed:@"knowledge_imgbg_question"] forState:UIControlStateNormal];
        [questionNoBtn setTitle:@"1/16" forState:UIControlStateNormal];
        questionNoBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:questionNoBtn];
        
        [questionNoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.top.equalTo(self).offset(5);
            make.width.equalTo(@30);
            make.height.equalTo(@15);
        }];
    }
    return self;
}

@end
