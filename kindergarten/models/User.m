//
//  User.m
//  kindergarten
//
//  Created by Scu_lbl on 15/4/29.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "User.h"

@implementation User

+(User*) initWithDictionary:(NSDictionary *)dic{
    User *user = [[User alloc] init];
    user.uid = [dic valueForKey:@"id"];
    user.name = [dic valueForKey:@"username"];
    user.role = [dic valueForKey:@"role"];
    user.phoneNumber = [dic valueForKey:@"login_phone"];
    user.isable = [dic valueForKey:@"is_able"];
    return user;
}

- (NSDictionary*) dictionaryFromObject{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    [dictionary setValue:self.uid forKey:@"id"];
    [dictionary setValue:self.password forKey:@"password"];
    [dictionary setValue:self.phoneNumber forKey:@"login_phone"];
    [dictionary setValue:self.role forKey:@"role"];
//    [dictionary setValue:self.classId forKey:@"cla_id"];
    return dictionary;
}

- (void)dealloc{
    NSLog(@"User is dead");
}
@end
