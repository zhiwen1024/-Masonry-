//
//  QuestionFrame.h
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionsOption.h"

@interface QuestionFrame : NSObject
@property (nonatomic,strong) QuestionsOption *questionOptionTest;

@property (nonatomic,readonly) CGFloat cellHeight;
@property (nonatomic,assign) CGFloat headerHeight;
@property (nonatomic,readonly) CGFloat footerHeight;

@property (nonatomic,readonly) CGRect qhcurrentQidFrame;
@property (nonatomic,readonly) CGRect qhquestionFrame;

@property (nonatomic,readonly) CGRect qcoptionFrame;
@property (nonatomic,readonly) CGRect qcContentFrame;
@property (nonatomic,readonly) CGRect qciconFrame;
@property (nonatomic,assign)CGRect contentLabelFrame;

@property (nonatomic,readonly) CGRect qfanswerFrame;
@property (nonatomic,readonly) CGRect qflineFrame;
@property (nonatomic,readonly) CGRect qfparsingFrame;
@property (nonatomic,readonly) CGRect qfcontentFrame;
@property (nonatomic,readonly) CGRect qfrelatedFrame;
@property (nonatomic,readonly) CGRect qfrelatedBtnFrame;
@end
