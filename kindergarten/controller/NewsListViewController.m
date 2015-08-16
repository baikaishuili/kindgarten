//
//  NewsListViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/23.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "NewsListViewController.h"
#import "GartenNoticeService.h"
#import "ResponseResult.h"
#import "GartenNotice.h"
#import "NoticeDetailViewController.h"
@interface NewsListViewController ()

@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.newsTableView.delegate = self;
    self.newsTableView.dataSource = self;
    GartenNoticeService *service = [[GartenNoticeService alloc]init];
    ResponseResult *result = [service getNoticeList];
    self.noticeList = result.data;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回每个section的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.noticeList.count;
}

//返回section的数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@""];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *result = nil;
    if( [tableView isEqual:self.newsTableView]) {
        static NSString *cellIdentifier = @"Cells";
        result = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if( result == nil) {
            result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        
        result.textLabel.text = [NSString stringWithFormat:@"%@",[[self.noticeList objectAtIndex:indexPath.row]title]];
    }
    
    return result;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GartenNotice *notice = [self.noticeList objectAtIndex:[indexPath row]];
    NSLog(@"%@",notice.url);  //这个表示选中的那个cell上的数据
    GartenNoticeService *service = [[GartenNoticeService alloc]init];
    ResponseResult *result = [service getNoticeContent:notice.url];

    NoticeDetailViewController *noticeView = [self.storyboard instantiateViewControllerWithIdentifier:@"noticeDetailViewControllerId"];
    noticeView.image = [UIImage imageWithData:result.data];
    [self.navigationController pushViewController:noticeView animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
