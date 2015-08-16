//
//  GartenNewsViewController.m
//  kindergarten
//
//  Created by Scu_lbl on 15/5/12.
//  Copyright (c) 2015年 Scu_lbl. All rights reserved.
//

#import "GartenNewsViewController.h"
#import "HttpWork.h"


@interface GartenNewsViewController ()

@end

@implementation GartenNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *items =  self.tabBar.items;
    [[items objectAtIndex:0] setTitle:@"每周食谱"];
    [[items objectAtIndex:0] setTag:1];
    [[items objectAtIndex:0] setImage:[UIImage imageNamed:@"icon_dinner.png"]];

    [[items objectAtIndex:1] setTitle:@"园内新闻"];
    [[items objectAtIndex:1] setTag:2];
    [[items objectAtIndex:1] setImage:[UIImage imageNamed:@"icon_garten_news.png"]];
    
    [[items objectAtIndex:2] setTitle:@"教研资讯"];
    [[items objectAtIndex:2] setTag:3];
    [[items objectAtIndex:2] setImage:[UIImage imageNamed:@"icon_teach_info.png"]];
    

}

//恢复导航条
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    NSLog(@"title is :%@ -- %d",item.title,item.tag);
    NSLog(@"title is :%@ ",self.selectedViewController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

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
