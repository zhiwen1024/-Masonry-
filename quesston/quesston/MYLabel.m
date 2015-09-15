//
//  MYLabel.m
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "MYLabel.h"

@implementation MYLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIButton *questionNoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _questionNoBtn = questionNoBtn;
        [questionNoBtn setBackgroundImage:[UIImage imageNamed:@"knowledge_imgbg_question"] forState:UIControlStateNormal];
        [questionNoBtn setTitle:@"1/16" forState:UIControlStateNormal];
        questionNoBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:questionNoBtn];
        
        [questionNoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(0);
            make.top.equalTo(self).offset(0);
            make.width.equalTo(@30);
            make.height.equalTo(@15);
        }];
    }
    return self;
}

@end
