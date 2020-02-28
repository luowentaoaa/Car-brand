//
//  LLGruop.m
//  汽车品牌展示2
//
//  Created by luowentao on 2020/2/28.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLGruop.h"
#import "LLCar.h"
@implementation LLGruop

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        NSMutableArray *arrayModels=[NSMutableArray array];
        self.title=dict[@"title"];
        for(NSDictionary *item in dict[@"cars"]){
            LLCar *model=[LLCar carWithDict:item];
            [arrayModels addObject:model];
        }
        self.cars=arrayModels;
        
    }
    return self;
}
+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict: dict];
}

@end
