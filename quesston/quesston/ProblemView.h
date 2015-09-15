//
//  ProblemView.h
//  quesston
//
//  Created by cdel_GL on 15/8/7.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionView.h"
#import "OptionView.h"



@interface ProblemView : UIView

/**头部视图*/
@property (nonatomic,strong) UIView *questionTopView;
/**头部数据*/
@property (nonatomic,strong) NSArray *dataHeaderArr;
/**选项数据*/
@property (nonatomic,strong) NSArray *dataCellArr;
/**解析数据*/
@property (nonatomic,strong) NSArray *dataFooterArr;
@property (nonatomic,strong)UILabel *tiXingLabel;

//- (void)loadDataQuestionViewHeaderArr:(NSArray *)headerArr CellArr:(NSArray *)cellArr FooterArr:(NSArray *)footerArr;


@end
