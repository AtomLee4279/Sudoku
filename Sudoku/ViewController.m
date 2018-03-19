//
//  ViewController.m
//  Sudoku
//
//  Created by 李一贤 on 2018/3/16.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
@interface ViewController ()
@property(nonatomic,strong) NSArray* apps;
@end

@implementation ViewController

//懒加载
-(NSArray*)apps
{
    if(_apps==nil)
    {
//        NSString* path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
        NSString* path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        NSArray* dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary*dict in dictArray)
        {
            AppModel * appmodel = [AppModel appModelWithDict:dict];
            [tempArray addObject:appmodel];
        }
        _apps = tempArray;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat spaceXMargin = 10;//x方向上,中间两个格子间的 间隙
    CGFloat spaceYMargin = 50;//y方向上,中间两个格子间的 间隙
    CGFloat appviewW = 100;//格子宽度
    CGFloat appviewH = 120;//格子高度
    CGFloat XMargin = (self.view.frame.size.width - 3*appviewW-2*spaceXMargin)*0.5;//x方向，格子与边缘的间隙
    CGFloat YMargin = (self.view.frame.size.height - 3*appviewH-2*spaceYMargin)*0.5;//y方向，格子与边缘的间隙
    for(int i =0;i<self.apps.count;i++)
    {
        int col = i%3;
        int row = i/3;
        //取出数据存进模型，为后面的控件设置具体内容作准备
        AppModel *appModel = self.apps[i];
        //生成格子:使用加载xib的方法
        UIView* appView = [[[NSBundle mainBundle] loadNibNamed:@"appView" owner:nil options:nil] lastObject];
        //设置格子位置，尺寸、背景色
        CGFloat appViewX = XMargin+col*(appviewW+spaceXMargin);
        CGFloat appViewY = YMargin+row*(appviewH+spaceYMargin);
        appView.frame = CGRectMake(appViewX,appViewY, appviewW, appviewH);
        appView.backgroundColor = [UIColor grayColor];
        //获取格子子控件并为它们赋值
        UIImageView* imageView = appView.subviews[0];//按照xib布局顺序，subviews第一个控件是UIImageView
        imageView.image = [UIImage imageNamed:appModel.icon];
        UILabel* label = appView.subviews[1];
        label.text = appModel.name;
        [self.view addSubview:appView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
