//
//  LLCar.m
//  汽车品牌展示2
//
//  Created by luowentao on 2020/2/28.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLCar.h"

@implementation LLCar
-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self =[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)carWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
