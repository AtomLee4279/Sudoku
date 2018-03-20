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



@end
