//
//  LLCar.h
//  汽车品牌展示2
//
//  Created by luowentao on 2020/2/28.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLCar : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *name;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)carWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
