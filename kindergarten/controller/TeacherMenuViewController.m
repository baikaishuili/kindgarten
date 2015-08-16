//
//  TeacherMenuViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/6/10.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "TeacherMenuViewController.h"

@interface TeacherMenuViewController ()

@end

@implementation TeacherMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *imageData = [[NSUserDefaults standardUserDefaults]  dataForKey:PHOTO_IMAGE];
    if (nil != imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        self.photo.image = image;
    }
    self.photo.layer.masksToBounds = YES;
    [self.photo.layer setCornerRadius:CGRectGetHeight([self.photo bounds])*0.5];
    self.photo.layer.borderWidth = 2.0;
    self.photo.layer.borderColor = [UIColor grayColor].CGColor;
    //显示名字
    self.nameLabel.text = [[UserInstance sharedUserInstance] UserInstance].name;
    // Do any additional setup after loading the view.
    self.photo.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoClicked)];
    [self.photo addGestureRecognizer:singleTap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)NoticeBtnClicked:(id)sender{
    ClassNoticeService *classNoticeService = [[ClassNoticeService alloc] init];
    ResponseResult *result = [classNoticeService classNotice: [[UserInstance sharedUserInstance] UserInstance]];
    ClassNoticeViewController *noticeView = [self.storyboard instantiateViewControllerWithIdentifier:@"noticeViewControllerId"];
    noticeView.noticeList = result.data;
    [self.navigationController pushViewController:noticeView animated:YES];
    
}

- (IBAction)babySightBtnClicked:(id)sender {
    NSString *serverAddr = HAICON_HOST_NAME;
    serverAddr = [serverAddr uppercaseString];
    if(![serverAddr hasPrefix:@"HTTP://"])
    {
        serverAddr = [NSString stringWithFormat:@"HTTP://%@",serverAddr];
    }
    User *user = [[UserInstance sharedUserInstance] UserInstance];
    NSString *userName = [[user.baby objectAtIndex:0] classRoom].name;
    NSString *password = [[user.baby objectAtIndex:0] classRoom].password;
    VMSNetSDK * vmsNetSdk = [VMSNetSDK shareInstance] ;
    self.serverInfo = [[CMSPInfo alloc]init] ;
    BOOL ret = [vmsNetSdk login:serverAddr toUserName:userName toPassword:password toLineID:1 toServInfo:self.serverInfo];
    if(!ret)
    {
        //如果登录不上，可能是新6.x平台，再使用新平台登录方式登录
        ret = [vmsNetSdk loginV40:serverAddr toUserName:userName toPassword:password toServInfo:self.serverInfo];
        if(!ret)
        {
            NSLog(@"login failed ! errno = %d",vmsNetSdk.nLastError);
            return;
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",vmsNetSdk.version] forKey:SERVER_VERSION];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    ResourceTreeViewController *treeViewController = [[ResourceTreeViewController alloc] initWithNibName:NSStringFromClass([ResourceTreeViewController class]) bundle:nil withServerInfo:self.serverInfo];
    //跳转到资源树列表
    [self.navigationController pushViewController:treeViewController animated:YES];
}

- (IBAction)growthFileBtnClicked:(id)sender {
    MessageViewController *messageView = [self.storyboard instantiateViewControllerWithIdentifier:@"growthFileViewControllerId"];
    [self.navigationController pushViewController:messageView animated:YES];
}

- (IBAction)messageBtnClicked:(id)sender {
    MessageViewController *messageView = [self.storyboard instantiateViewControllerWithIdentifier:@"messageViewControllerId"];
    [self.navigationController pushViewController:messageView animated:YES];
}

- (IBAction)connectionBtnClicked:(id)sender {
    PhoneConnectService *service = [[PhoneConnectService alloc] init];
    Baby *baby = [[UserInstance sharedUserInstance] UserInstance].baby;
    ResponseResult *result = [service getTeacherByBaby:baby];
    NSArray *userList = [result data];
    PhoneConnectionViewController *connectionView = [self.storyboard instantiateViewControllerWithIdentifier:@"connectionViewControllerId"];
    connectionView.userList = userList;
    [self.navigationController pushViewController:connectionView animated:YES];
}

- (IBAction)gartenNewsBtnClicked:(id)sender {
    GartenNewsViewController *newsView = [self.storyboard instantiateViewControllerWithIdentifier:@"GartenNewsViewControllerId"];
    [self.navigationController pushViewController:newsView animated:YES];
}

- (IBAction)accountBtnClicked:(id)sender {
    AccountManagerViewController *accountManagerView = [self.storyboard instantiateViewControllerWithIdentifier:@"accountManagerViewControllerId"];
    [self.navigationController pushViewController:accountManagerView animated:YES];
}
//头像选择
-(void) photoClicked {
    //实例化照片选择控制器
    UIImagePickerController *pickControl=[[UIImagePickerController alloc]init];
    //设置照片源
    [pickControl setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //设置协议
    [pickControl setDelegate:self];
    //设置编辑
    [pickControl setAllowsEditing:YES];
    //选完图片之后回到的视图界面
    [self presentViewController:pickControl animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //    UIImage *image=info[@"UIImagePickerControllerOriginalImage"];
    
    UIImage *image= [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSData *imageData = UIImageJPEGRepresentation(image, 100);
    [[NSUserDefaults standardUserDefaults] setObject: imageData forKey:PHOTO_IMAGE];
    [self.photo setImage:image];
    //选取完图片之后关闭视图
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    BabySightViewController *babySight =segue.destinationViewController;
//    babySight.serverInfo = self.serverInfo;
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
