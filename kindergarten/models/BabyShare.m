//
//  BabyShare.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "BabyShare.h"

@implementation BabyShare

+(BabyShare*) initWithDictionary:(NSDictionary *)dic{
    BabyShare *babyShare = [[BabyShare alloc] init];
    babyShare.sid = [dic objectForKey:@"id"];
    babyShare.date = [dic objectForKey:@"msgDate"];
    babyShare.content = [dic objectForKey:@"leaveMsg"];
    babyShare.classId = [dic objectForKey:@"claId"];
    babyShare.babyId = [dic objectForKey:@"babyId"];
    babyShare.msgId = [dic objectForKey:@"msgId"];
    return babyShare;
}
@end
