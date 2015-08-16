//
//  Baby.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "Baby.h"

@implementation Baby

- (NSDictionary*) dictionaryFromObject{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:self.bid forKey:@"id"];
    [dictionary setValue:self.name forKey:@"babyName"];
    [dictionary setValue:self.birthday forKey:@"birthday"];
    [dictionary setValue:self.parentId forKey:@"parent_id"];
    [dictionary setValue:self.classId forKey:@"cla_id"];
    return dictionary;
}

+(Baby*) initWithDictionary:(NSDictionary *)dic{
    Baby *baby = [[Baby alloc] init];
    baby.bid = [dic valueForKey:@"id"];
    baby.name = [dic valueForKey:@"babyName"];
    baby.birthday = [dic valueForKey:@"birthday"];
    baby.parentId = [dic valueForKey:@"parent_id"];
    baby.classId = [dic valueForKey:@"cla_id"];
    return baby;
}
- (void)dealloc{
    NSLog(@"Baby is dead");
}
@end
