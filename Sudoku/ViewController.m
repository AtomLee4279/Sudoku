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
        NSString* path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
        NSArray* dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for(NSDictionary*dict in dictArray)
        {
            AppModel * appmodel = [[AppModel alloc] init];
            appmodel.name = dict[@"name"];
            appmodel.icon = dict[@"icon"];
            [tempArray addObject:appmodel];
        }
        _apps = tempArray;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for(int i =0;i<self.apps.count;i++)
    {
        CGFloat appViewX = 30+i*10;
        CGFloat appViewY = 30;
        CGFloat appviewW = 100;
        CGFloat appviewH = 120;
        UIView *appView = [[UIView alloc] init];
        appView.frame = CGRectMake(appViewX, appViewY, appviewW, appviewH);
        appView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:appView];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
