//
//  QuestionView.m
//  quesston
//
//  Created by cdel_GL on 15/8/6.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "QuestionView.h"
#import "UIView+Extension.h"
#import <Masonry.h>

@implementation QuestionView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _questionContent = [[MYWebView alloc]init];
        _questionContent.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _questionContent.hidden = YES;
        [self addSubview:_questionContent];
        
        _contentLabel = [[MYLabel alloc]init];
        _contentLabel.backgroundColor = [UIColor redColor];
        _contentLabel.hidden = YES;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:_contentLabel];
        
        [self.questionContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsZero);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

#pragma mark - 添加约束及添加数据
- (void)setQuestionHeaderFrame:(QuestionFrame *)questionHeaderFrame
{
    _questionHeaderFrame = questionHeaderFrame;
    _questionContent.frame = _questionHeaderFrame.qhquestionFrame;
    
    QuestionsOption *questionOption = self.questionHeaderFrame.questionOptionTest;
    NSString *str =  questionOption.questionTitle;
    NSString *content = nil;
    if ([str containsString:@"<br />"]) {//是网页
        self.contentLabel.hidden = YES;
        self.questionContent.hidden = NO;
        content = [NSString stringWithFormat:@"<html> \n"
                   "<head> \n"
                   "<style type=\"text/css\"> \n"
                   "body {margin:0px;line-height:25px;font-family: \"%@\"; color: %@;font-size:%dpx;background-color:transparent;}\n"
                   "a{ text-decoration:none; color: %@;} \n"
                   "table{font-size:11px;text-indent:none;max-width:283px;width:auto !important;width:283px;} \n"
                   "td {text-indent:0px;text-aligment:left} \n"
                   "</style> \n"
                   "</head> \n"
                   "<body><div style=\"text-indent:30px;\">%@ </div></br>\n"
                   "</body></html>", @"Heiti SC", [UIColor clearColor], 13, @"#333333", questionOption.questionTitle];
        [_questionContent loadHTMLString:content baseURL:nil];
        
    }else{
        self.contentLabel.hidden = NO;
        self.questionContent.hidden = YES;
        self.contentLabel.text = questionOption.questionTitle;
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(questionHeaderFrame.headerHeight);
        }];
    }
}


#pragma mark - dataArr
- (void)loadDataQuestionViewHeaderArr:(NSArray *)headerArr CellArr:(NSArray *)cellArr FooterArr:(NSArray *)footerArr
{
    if (headerArr || cellArr || footerArr) {
        self.dataHeaderArr = headerArr;
        self.dataCellArr = cellArr;
        self.dataFooterArr = footerArr;

    }
}

@end
