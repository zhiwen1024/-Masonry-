//
//  QuestionsOption.h
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsOption : NSObject
//题目header
@property (nonatomic,copy) NSString *questionTitle;
//选项cell
@property (nonatomic,copy) NSString *optionsContent;
@property (nonatomic,copy) NSString *questionValue;
@property (nonatomic,assign)BOOL isSelected;
//解析footer
@property (nonatomic,copy) NSString *analysisContent;
@property (nonatomic,copy) NSString *relatedContent;
@property (nonatomic,copy) NSString *answertext;


#pragma mark 根据字典初始化内容对象
- (QuestionsOption * )initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化内容对象（静态方法）
+ (QuestionsOption *)statusWithDictionary:(NSDictionary *)dic;
@end
