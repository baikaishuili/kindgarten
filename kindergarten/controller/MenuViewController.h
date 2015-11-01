//
//  MenuViewController.h
//  kindergarten
//
//  Created by Scu_lbl on 15/4/26.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMSPInfo;
@interface MenuViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *photo;
//用于保存服务器信息
@property(nonatomic,retain)CMSPInfo *serverInfo;
////点击通知公告
//- (IBAction)NoticeBtnClicked:(id)sender;
////点击看宝宝
//- (IBAction)babySightBtnClicked:(id)sender;
////点击成长档案
//- (IBAction)growthFileBtnClicked:(id)sender;
////点击家长留言
//- (IBAction)messageBtnClicked:(id)sender;
////点击电话连线
//- (IBAction)connectionBtnClicked:(id)sender;
////点击园内新闻
//- (IBAction)gartenNewsBtnClicked:(id)sender;
////点击账户管理
//- (IBAction)accountBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

//点击头像
-(void) photoClicked;
//点击电话连线
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end
