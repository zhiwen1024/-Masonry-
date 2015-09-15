//
//  NewOptionView.h
//  quesston
//
//  Created by cdel_GL on 15/8/14.
//  Copyright (c) 2015年 ZZW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionFrame.h"

@interface NewOptionView : UIView
/**左边的图片*/
@property(nonatomic,strong)UIImageView *optionsIV;
/**选项内容*/
@property (nonatomic,strong)UILabel *optionContentLab;
/**webView*/
@property (nonatomic,strong)UIWebView *cellWebView;
/**模型*/
@property (nonatomic,strong) QuestionFrame *questionCellFrame;
@property (nonatomic,strong)UILabel *optionsValueLab;
@property (nonatomic,strong)UILabel *valueLabel;
/**题型*/
@property (nonatomic,copy)NSString *Type;
/**是否选中*/
@property (nonatomic,assign)BOOL isSelected;
@end
