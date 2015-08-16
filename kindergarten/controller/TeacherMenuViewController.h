//
//  TeacherMenuViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/6/10.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassNoticeService.h"
#import "UserInstance.h"
#import "SystemInfo.h"
#import "VMSNetSDK.h"
#import "Prefix.h"
#import "ResourceTreeViewController.h"
#import "User.h"
#import "Baby.h"
#import "ClassRoom.h"
#import "ClassNoticeViewController.h"
#import "PhoneConnectionViewController.h"
#import "MessageViewController.h"
#import "AccountManagerViewController.h"
#import "GartenNewsViewController.h"
#import "GrowthFileViewController.h"
#import "Baby.h"
#import "PhoneConnectService.h"
#import "ResponseResult.h"

@interface TeacherMenuViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photo;
//用于保存服务器信息
@property(nonatomic,retain)CMSPInfo *serverInfo;
//点击通知公告
- (IBAction)NoticeBtnClicked:(id)sender;
//点击看宝宝
- (IBAction)babySightBtnClicked:(id)sender;
//点击成长档案
- (IBAction)growthFileBtnClicked:(id)sender;
//点击家长留言
- (IBAction)messageBtnClicked:(id)sender;
//点击园内新闻
- (IBAction)gartenNewsBtnClicked:(id)sender;
//点击账户管理
- (IBAction)accountBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//点击头像
-(void) photoClicked;
@end
