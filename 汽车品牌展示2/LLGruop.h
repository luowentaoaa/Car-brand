//
//  LLGruop.h
//  汽车品牌展示2
//
//  Created by luowentao on 2020/2/28.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLGruop : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSArray *cars;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
