//
//  AppView.m
//  Sudoku
//
//  Created by 李一贤 on 2018/3/19.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "AppView.h"
#import "AppModel.h"
@implementation AppView

-(void)initWithAppModel:(AppModel*)appModel
{
        //设置图片内容
        _image.image = [UIImage imageNamed:appModel.icon];
        //设置文本内容
        _label.text = appModel.name;
        return; 
}
//重写AppModel的set方法
-(void)setAppModel:(AppModel *)appModel
{
    //固定写法，去掉也不会影响模型赋值数据。但是会影响模型的get方法。因为重写了AppModel的set方法，如果调用AppModel的get方法会出问题
    _appModel = appModel;
    //设置图片内容
    _image.image = [UIImage imageNamed:appModel.icon];
    //设置文本内容
    _label.text = appModel.name;
}
+(instancetype)loadXib
{
     AppView* appView = [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
    return appView;
}

- (IBAction)downLoad:(UIButton *)sender
{
    UILabel* msgLabel = [[UILabel alloc]init];
    CGFloat msgLabelW = 80;
    CGFloat msgLabelH = 30;
    CGFloat msgLabelX = (self.superview.frame.size.width - msgLabelW)*0.5;
    CGFloat msgLabelY = (self.superview.frame.size.height- msgLabelH)*0.5;
    msgLabel.frame = CGRectMake(msgLabelX, msgLabelY, msgLabelW, msgLabelH);
    msgLabel.backgroundColor = [UIColor redColor];
    msgLabel.text = @"XXX";
    msgLabel.textAlignment = NSTextAlignmentCenter;
    //设置半径
    msgLabel.layer.cornerRadius = 8;
    //切掉多余部分
    msgLabel.layer.masksToBounds = YES;
    //设置block动画-参数说明：
    //animations:执行动画代码
    //completion:动画完成之后要做的事情
    [UIView animateWithDuration:1.0 animations:^{
        msgLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        if(finished)
        {
            //delay:表示动画延迟多长时间后执行
            [UIView animateWithDuration:(2.0) delay:0.0 options:(UIViewAnimationOptionCurveLinear) animations:^{
                msgLabel.alpha = 0.0;
            } completion:^(BOOL finished) {
                if(finished)
                {
                    [msgLabel removeFromSuperview];//将文本控件从父控件中移除
                }
            }];
        }
    }];
    
    [self.superview addSubview:msgLabel];
    
}



@end
