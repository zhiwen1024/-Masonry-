//
//  OptionView.m
//  quesston
//
//  Created by cdel_GL on 15/8/6.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "OptionView.h"
@interface OptionView()

@end
#define HWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HWRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@implementation OptionView
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HWRandomColor;
        //添加子控件
        [self addAllSubviews];
    }
    return self;
}

#pragma mark - 添加子控件
- (void)addAllSubviews
{
    _optionsIV = [[UIImageView alloc]init];
    _optionsIV.image = [UIImage imageNamed:@"icon-duoxuan-square-normal.png"];
    [self.contentView addSubview:_optionsIV];
    
    _optionsValueLab = [[UILabel alloc]init];
    _optionsValueLab.backgroundColor = [UIColor clearColor];
    _optionsValueLab.textAlignment = NSTextAlignmentCenter;
    _optionsValueLab.font = [UIFont fontWithName:@"Arial" size:14];
    _optionsValueLab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_optionsValueLab];
    
    _optionContentLab = [[UILabel alloc]init];
    _optionContentLab.textAlignment = NSTextAlignmentLeft;
    _optionContentLab.font = [UIFont fontWithName:@"Arial" size:14];
    _optionContentLab.textColor = [UIColor darkGrayColor];
    _optionContentLab.numberOfLines = 0;
    [self.contentView addSubview:_optionContentLab];
    
    _cellWebView = [[UIWebView alloc]init];
    _cellWebView.backgroundColor = HWRandomColor;
    [self.contentView addSubview:_cellWebView];
    [_optionsIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top).offset(0);
        make.width.equalTo(24);
        make.height.equalTo(24);
    }];
    [_optionsValueLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_optionsIV.mas_left).offset(7);
        make.top.equalTo(_optionsIV.mas_top).offset(5);
    }];
//    [self.cellWebView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(_optionsIV.mas_right).offset(5);
//        make.top.equalTo(self.mas_top).offset(0);
//        make.width.equalTo([UIScreen mainScreen].bounds.size.width - 63);
//    }];
    
}

#pragma mark - 设置frame及添加数据
- (void)setQuestionCellFrame:(QuestionFrame *)questionCellFrame
{
    _questionCellFrame = questionCellFrame;
    //设置frame
    _questionCellFrame = questionCellFrame;
    
    [_cellWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.bottom.width.right.top.equalTo(_optionContentLab);
    }];
    //设置数据
    [self setModelData];
    QuestionsOption *questionOption = self.questionCellFrame.questionOptionTest;
    NSString *str =  questionOption.optionsContent;
    NSString *content = nil;
    if ([str containsString:@"<br />"]) {//是网页
        self.optionContentLab.hidden = YES;
        self.cellWebView.hidden = NO;
        
        content = [NSString stringWithFormat:@"<html> \n"
                   "<head> \n"
                   "<style type=\"text/css\"> \n"
                   "body {margin:0px;line-height:25px;font-family: \"%@\"; color: %@;font-size:%dpx;background-color:transparent;}\n"
                   "a{ text-decoration:none; color: %@;} \n"
                   "table{font-size:11px;text-indent:none;max-width:283px;width:auto !important;width:283px;} \n"
                   "td {text-indent:0px;text-aligment:left} \n"
                   "</style> \n"
                   "</head> \n"
                   "<body><div style=\"text-indent:59px;\">%@ </div></br>\n"
                   "</body></html>", @"Heiti SC", [UIColor clearColor], 13, @"#333333", str];
        [self.cellWebView loadHTMLString:content baseURL:nil];
//        [self.cellWebView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(_optionsIV.mas_right).offset(5);
//            make.top.equalTo(self.mas_top).offset(0);
//            make.width.equalTo([UIScreen mainScreen].bounds.size.width - 63);
//        }];
        
    }
    else{
        
        self.optionContentLab.hidden = NO;
        self.cellWebView.hidden = YES;
        self.optionContentLab.text = str;
        [_optionContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_optionsIV.mas_right).offset(5);
            make.top.equalTo(self.mas_top).offset(0);
            make.width.equalTo([UIScreen mainScreen].bounds.size.width - 63);
            make.height.equalTo(questionCellFrame.cellHeight);
        }];
    }
    
}

//设置frame
//- (void)setModelFrame
//{
//    _optionsIV.frame = _questionCellFrame.qcoptionFrame;
//    _optionContentLab.frame = _questionCellFrame.qcContentFrame;
//    _optionsValueLab.frame = _questionCellFrame.qcoptionFrame;
//}
//添加数据
- (void)setModelData
{
    QuestionsOption *questionOption = self.questionCellFrame.questionOptionTest;
    questionOption.isSelected = self.isSelected;
    if (![self.Type isEqualToString:@"判断题"]) {
        _optionsValueLab.text = questionOption.questionValue;
    }
    _optionContentLab.text = questionOption.optionsContent;
}

@end
