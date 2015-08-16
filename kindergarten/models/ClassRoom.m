//
//  ClassRoom.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/2.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassRoom.h"

@implementation ClassRoom

+(ClassRoom*) initWithDictionary:(NSDictionary *)dic{
    ClassRoom *room = [[ClassRoom alloc] init];
    room.rid = [dic valueForKey:@"class_room_id"];
    room.name = [dic valueForKey:@"room_username"];
    room.no = [dic valueForKey:@"room_no"];
    room.password = [dic valueForKey:@"room_password"];
    return room;
}
- (void)dealloc{
    NSLog(@"ClassRoom is dead");
}
@end
