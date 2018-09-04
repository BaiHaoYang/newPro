//
//  ViewController.m
//  newPro
//
//  Created by HaoYang on 2018/8/23.
//  Copyright © 2018年 HaoYang. All rights reserved.
//

#import "ViewController.h"
#import <RongIMKit/RCConversationViewController.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RCConversationViewController *chat = [[RCConversationViewController alloc]init];
    
    //设置会话的类型，如单聊、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，群聊、聊天室为会话的ID）
    chat.targetId = @"13488666225";
    
    //设置聊天会话界面要显示的标题
    chat.title = @"lyly";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
