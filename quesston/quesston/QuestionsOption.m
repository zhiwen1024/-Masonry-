//
//  QuestionsOption.m
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "QuestionsOption.h"

@implementation QuestionsOption
- (QuestionsOption *)initWithDictionary:(NSDictionary *)dic{
    
    if (self  = [super init]) {
        self.isSelected = NO;
        self.questionTitle = dic[@"questionTitle"];
        
        self.optionsContent = dic[@"optionsContent"];
        self.questionValue = dic[@"questionValue"];
        
        self.analysisContent = dic[@"analysisContent"];
        self.relatedContent = dic[@"relatedContent"];
        self.answertext = dic[@"answertext"];
        
    }
    return self;
    
}

+(QuestionsOption *)statusWithDictionary:(NSDictionary *)dic{
    
    QuestionsOption * questions = [[QuestionsOption alloc]initWithDictionary:dic];
    
    return questions;
    
}
@end
