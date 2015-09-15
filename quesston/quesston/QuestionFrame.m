//
//  QuestionFrame.m
//  quesston
//
//  Created by cdel_GL on 15/8/12.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import "QuestionFrame.h"
#import "QuestionsOption.h"

/**
 *  设置各控件宏
 */
#define qCellBorderWidth 0
#define qhquestionFont [UIFont systemFontOfSize:14]

//cell选项
#define qcoptionWidth 23

@implementation QuestionFrame

- (void)setQuestionOptionTest:(QuestionsOption *)questionOptionTest
{
    _questionOptionTest = questionOptionTest;
    //整个tableVIew的宽度
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    
    //header
    CGFloat qhquestionX = qCellBorderWidth ;
    CGFloat qhquestionY = qCellBorderWidth;
    CGSize qhquestionSize = [self sizeWithText:_questionOptionTest.questionTitle font:qhquestionFont maxSize:CGSizeMake(cellWidth- 40, MAXFLOAT)];
    _qhquestionFrame = (CGRect){{qhquestionX, qhquestionY}, qhquestionSize};
    _contentLabelFrame = (CGRect){{qhquestionX, qhquestionY}, qhquestionSize};
    
    
    //cell
    
    //    qciconFrame
    
    CGFloat qcoptionX = qCellBorderWidth;
    CGFloat qcoptionY = CGRectGetMaxY(_qhquestionFrame) + 6;
    CGSize qcoptionSize = CGSizeMake(qcoptionWidth, qcoptionWidth);
    _qcoptionFrame = (CGRect){{qcoptionX,qcoptionY+2},qcoptionSize};
    CGFloat qcContentX = qcoptionWidth ;
    CGFloat qcContentY = CGRectGetMaxY(_qhquestionFrame) + 6;
    CGSize qcContentSize = [self sizeWithText:_questionOptionTest.optionsContent font:qhquestionFont maxSize:CGSizeMake(cellWidth-40, MAXFLOAT)];
    _qcContentFrame = (CGRect){{qcContentX, qcContentY+5}, qcContentSize};
    
    //footer
    CGFloat qfanswerX = qCellBorderWidth;
    CGFloat qfanswerY = CGRectGetMaxY(_qcContentFrame);
    CGSize qfanswerSize = [self sizeWithText:_questionOptionTest.answertext font:qhquestionFont maxSize:CGSizeMake(cellWidth, MAXFLOAT)];
    _qfanswerFrame = (CGRect){{qfanswerX,qfanswerY},qfanswerSize};
    
    CGFloat qflineX = qCellBorderWidth;
    CGFloat qflineY = CGRectGetMaxY(_qcContentFrame) + 20;
    CGSize qflineSize = CGSizeMake(320, 1);
    _qflineFrame = (CGRect){{qflineX,qflineY},qflineSize};
    
    CGFloat afparsingX = qCellBorderWidth + 5;
    CGFloat afparsingY = CGRectGetMaxY(_qflineFrame) + 20;
    CGSize afparsingSize = CGSizeMake(39, 17);
    _qfparsingFrame = (CGRect){{afparsingX,afparsingY},afparsingSize};
    
    CGFloat afcontentX = qCellBorderWidth + 5;
    CGFloat afcontentY = CGRectGetMaxY(_qfparsingFrame) + 15;
    CGSize afcontentSize = [self sizeWithText:_questionOptionTest.analysisContent font:qhquestionFont maxSize:CGSizeMake(cellWidth, MAXFLOAT)];
    _qfcontentFrame = (CGRect){{afcontentX,afcontentY},afcontentSize};
    
    
    CGFloat afrelatedX = qCellBorderWidth + 5;
    CGFloat afrelatedY = CGRectGetMaxY(_qfcontentFrame) + 25;
    CGSize affrelatedSize = CGSizeMake(77, 17);
    _qfrelatedFrame = (CGRect){{afrelatedX,afrelatedY},affrelatedSize};
    
    CGFloat afrelatedBtnX = qCellBorderWidth + 8;
    CGFloat afrelatedBtnY = CGRectGetMaxY(_qfrelatedFrame) + 5;
    CGSize afrelatedBtnSize = CGSizeMake(230, 17);
    _qfrelatedBtnFrame = (CGRect){{afrelatedBtnX,afrelatedBtnY},afrelatedBtnSize};
    
    _headerHeight = CGRectGetMaxY(_qhquestionFrame);
    _cellHeight = CGRectGetMaxY(_qcContentFrame);
    _footerHeight = CGRectGetMaxY(_qfrelatedBtnFrame);
}



// 根据字符串\字体\最大大小,来计算大小的方法
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <7.0) {
        return [text sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    }else{
        
        return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    }
    
}
@end
