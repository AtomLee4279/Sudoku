//
//  AppView.h
//  Sudoku
//
//  Created by 李一贤 on 2018/3/19.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppModel;
@interface AppView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property(strong,nonatomic)AppModel* appModel;
-(void)initWithAppModel:(AppModel*)appModel;
//此处重写了AppModel的set方法
-(void)setAppModel:(AppModel *)appModel;

@end
