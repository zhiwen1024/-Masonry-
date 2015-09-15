//
//  QuestionView.h
//  quesston
//
//  Created by cdel_GL on 15/8/6.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MYWebView.h"
#import "MYLabel.h"
#import "QuestionFrame.h"
#import "QuestionsOption.h"

@interface QuestionView : UIView

@property (nonatomic,strong)MYWebView *questionContent;
@property (nonatomic,strong)MYLabel *contentLabel;
@property (nonatomic,strong) QuestionFrame *questionHeaderFrame;
/**头部数据*/
@property (nonatomic,strong) NSArray *dataHeaderArr;
/**选项数据*/
@property (nonatomic,strong) NSArray *dataCellArr;
/**解析数据*/
@property (nonatomic,strong) NSArray *dataFooterArr;
@property (nonatomic,strong)QuestionsOption *model;

- (void)loadDataQuestionViewHeaderArr:(NSArray *)headerArr CellArr:(NSArray *)cellArr FooterArr:(NSArray *)footerArr;
@end
