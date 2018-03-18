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
        //生成格子
        UIView *appView = [[UIView alloc] init ];
        //设置格子位置，尺寸
        CGFloat appViewX = XMargin+col*(appviewW+spaceXMargin);
        CGFloat appViewY = YMargin+row*(appviewH+spaceYMargin);
        appView.frame = CGRectMake(appViewX,appViewY, appviewW, appviewH);
        appView.backgroundColor = [UIColor grayColor];
        
        //生成图片并添加进格子父控件中
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:appModel.icon];
        //设置图片位置居中于父控件
        CGFloat imageW = 75;
        CGFloat imageH = 75;
        CGFloat imageX = (appviewW-imageW)*0.5;
        CGFloat imageY = 0;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        imageView.backgroundColor = [UIColor redColor];
        [appView addSubview:imageView];
        
        //生成文本label并添加进格子父控件中
        UILabel* label = [[UILabel alloc]init];
        label.text = appModel.name;
        //设置文本框长度与父控件宽度一致，位置暂定为紧靠图片控件之下
        CGFloat labelW = appviewW;
        CGFloat labelH = 10;
        CGFloat labelx = 0;
        CGFloat offset = 5;//文本框相对于图片控件高度的偏移量，独立出来以便后续改需求
        CGFloat labely = imageH+offset;
        label.frame = CGRectMake(labelx, labely, labelW, labelH);
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;//文本居中
        label.font = [UIFont systemFontOfSize:18];//字体大小
        [appView addSubview:label];
        
        //生成按钮btn并添加进格子父控件中
        UIButton* btn = [[UIButton alloc]init];
        //初定一个按钮x坐标
        CGFloat btnX = 10;
        //按钮与文本控件的垂直间隙
        CGFloat spaceMargin = 5;
        //按钮宽高
        CGFloat btnW = appviewW -2*btnX;
        CGFloat btnH = 10;
        //按钮Y坐标
        CGFloat btnY = labely+labelH+spaceMargin;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.backgroundColor = [UIColor greenColor];
        //按钮文字
        [btn setTitle:@"下载" forState:(UIControlStateNormal)];
        [appView addSubview:btn];
        [self.view addSubview:appView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
