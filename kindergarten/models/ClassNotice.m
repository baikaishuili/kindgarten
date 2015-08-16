//
//  ClassNotice.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/25.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "ClassNotice.h"

@implementation ClassNotice

+(ClassNotice*) initWithDictionary:(NSDictionary *)dic{
    ClassNotice *notice = [[ClassNotice alloc] init];
    notice.nid = [dic objectForKey:@"id"];
    notice.date = [[dic objectForKey:@"pubdate"] substringWithRange:NSMakeRange(0, 10)];
    notice.content = [dic objectForKey:@"msg"];
    notice.teacherId = [dic objectForKey:@"teacher_id"];
    notice.classId = [dic objectForKey:@"cla_id"];
    notice.checkedId = [dic objectForKey:@"checker_id"];
    notice.status = [[dic objectForKey:@"status"] intValue];
    return notice;
}
@end
