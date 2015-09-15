//
//  ProblemView.m
//  quesston
//
//  Created by cdel_GL on 15/8/7.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//  头部视图

#import "ProblemView.h"
#import <Masonry.h>

@implementation ProblemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //topView
        [self initTopView];
    }
    return self;
}
- (void)initTopView
{
    UIView *questionTopView = [[UIView alloc]init];
    [self addSubview:questionTopView];
    self.questionTopView = questionTopView;
    UILabel *hitLab = [[UILabel alloc]init];
    hitLab.backgroundColor = [UIColor greenColor];
    [hitLab sizeToFit];
    hitLab.backgroundColor = [UIColor clearColor];
    hitLab.textAlignment = UITextAlignmentCenter;
    hitLab.text = @"选择题123";
    self.tiXingLabel = hitLab;
//    hitLab.textColor = [UIColor colorWithHexString:@"#b4b3b3"];
    hitLab.font = [UIFont fontWithName:@"Arial" size:10];
    [questionTopView addSubview:hitLab];
    
    UIImageView *leftArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"knowledge_img_left_type"]];
    [questionTopView addSubview:leftArrow];
    
    UIImageView *rightArrow = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"knowledge_img_right_type"]];
    [questionTopView addSubview:rightArrow];
    
    UIView *superView = self;
    [questionTopView mas_makeConstraints:^(MASConstraintMaker *make){
//        make.left.with.right.with.top.equalTo(superView);
        make.height.equalTo(34);
        make.center.equalTo(superView);
    }];
    
    [hitLab mas_makeConstraints:^(MASConstraintMaker *make){
        make.left.with.right.with.bottom.equalTo(questionTopView);
        make.top.equalTo(questionTopView.mas_top).offset(2);
    }];
    
    [leftArrow mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(40);
        make.height.equalTo(4);
        make.right.equalTo(hitLab.mas_left).offset(-10);
        make.top.equalTo(15);
        
    }];
    [rightArrow mas_makeConstraints:^(MASConstraintMaker *make){
        make.width.equalTo(40);
        make.height.equalTo(4);
        make.left.equalTo(hitLab.mas_right).offset(10);
        make.top.equalTo(15);
    }];
}

//#pragma mark - dataArr
//- (void)loadDataQuestionViewHeaderArr:(NSArray *)headerArr CellArr:(NSArray *)cellArr FooterArr:(NSArray *)footerArr
//{
//    if (headerArr || cellArr || footerArr) {
//        self.dataHeaderArr = headerArr;
//        self.dataCellArr = cellArr;
//        self.dataFooterArr = footerArr;
//    }
//}
@end
