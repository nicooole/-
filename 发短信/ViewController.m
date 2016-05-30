//
//  ViewController.m
//  发短信
//
//  Created by 南珂 on 16/5/29.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMessageComposeViewControllerDelegate>
- (IBAction)sendMessage:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
{
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *msgController = [MFMessageComposeViewController new];
        msgController.recipients = phones;
        msgController.body = body;
        msgController.title = title;
        msgController.messageComposeDelegate = self;
        msgController.navigationBar.tintColor = [UIColor redColor];
        [self presentViewController:msgController animated:YES completion:nil];
    }else{
        NSLog(@"该设备不能发短信");
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
            NSLog(@"发短信成功");
            break;
            case MessageComposeResultFailed:
            NSLog(@"发短信失败");
            break;
        case MessageComposeResultCancelled:
            NSLog(@"取消发送");
            break;
        default:
            break;
    }
}
- (IBAction)sendMessage:(UIButton *)sender {
    [self showMessageView:@[@"15517161658"] title:@"msg title" body:@"测试发短信"];
}
@end
