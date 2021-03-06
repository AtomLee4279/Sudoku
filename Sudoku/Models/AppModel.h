//
//  AppModel.h
//  Sudoku
//
//  Created by 李一贤 on 2018/3/16.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
@property(nonatomic,copy)NSString* name;
@property(nonatomic,copy)NSString* icon;
//传入字典，返回该模型类
-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)appModelWithDict:(NSDictionary*)dict;
@end
