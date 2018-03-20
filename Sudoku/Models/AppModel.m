//
//  AppModel.m
//  Sudoku
//
//  Created by 李一贤 on 2018/3/16.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel
-(instancetype)initWithDict:(NSDictionary*)dict
{
    if(self = [super init])
    {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+(instancetype)appModelWithDict:(NSDictionary*)dict
{
    return [[self alloc]initWithDict:dict];//注意：这里用self申请内存而不是AppModel,是出于以后需求变动的考虑，有子类扩展了父类属性，重写了上面的initWithDict方法，然后又调用了该父类方法appModelWithDict。这样就可根据实际子类对象申请内存,实现多态。
}
@end
