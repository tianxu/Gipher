//
//  ViewController.m
//  Gipher
//
//  Created by tianxu on 15/12/21.
//  Copyright © 2015年 tianxu. All rights reserved.
//

#import "ViewController.h"
//ShareSDK头文件
#import <ShareSDK/ShareSDK.h>

//自定义分享编辑页面需要
#import <ShareSDK/ISSShareViewDelegate.h>

//调用开放平台接口需要
#import <SinaWeiboConnection/ISSSinaWeiboApp.h>

@interface ViewController ()<ISSShareViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设为默认btn
    UIButton *_doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _doneBtn.frame = CGRectMake(120, 160, 100, 60);
    [_doneBtn setTitle:@"分享" forState:UIControlStateNormal];
    
    _doneBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_doneBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_doneBtn addTarget:self action:@selector(shareContent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_doneBtn];
}

/*
- (void)shareContent:(id)sender
{
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
//    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"shareImg" ofType:@"png"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@"Share your fabulous message with ShareSDK. @Mob移动开发者服务平台 @ShareSDK"
                                       defaultContent:nil
                                                image:localAttachment
                                                title:nil
                                                  url:nil
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeImage];
    
    //1+、创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender
                            arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、展现分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                NSLog(@"=== response state :%zi ",state);
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    
                                    
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}*/

- (void)shareContent:(id)sender
{//
    //1、构造分享内容
    //1.1、要分享的图片（以下分别是网络图片和本地图片的生成方式的示例）
//    id<ISSCAttachment> remoteAttachment = [ShareSDKCoreService attachmentWithUrl:@"http://f.hiphotos.bdimg.com/album/w%3D2048/sign=df8f1fe50dd79123e0e09374990c5882/cf1b9d16fdfaaf51e6d1ce528d5494eef01f7a28.jpg"];
    
    id<ISSCAttachment> localAttachment = [ShareSDKCoreService attachmentWithPath:[[NSBundle mainBundle] pathForResource:@"IMG_0392" ofType:@"JPG"]];
    
    //1.2、以下参数分别对应：内容、默认内容、图片、标题、链接、描述、分享类型
    id<ISSContent> publishContent = [ShareSDK content:@""
                                       defaultContent:nil
                                                image:localAttachment
                                                title:@""
                                                  url:@""
                                          description:nil
                                            mediaType:SSPublishContentMediaTypeImage];
    
    //1+、创建弹出菜单容器（iPad应用必要，iPhone应用非必要）
    id<ISSContainer> container = [ShareSDK container];
    [container setIPadContainerWithView:sender
                            arrowDirect:UIPopoverArrowDirectionUp];
    
    //2、展现分享菜单
    [ShareSDK showShareActionSheet:container
                         shareList:nil
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions:nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                
                                NSLog(@"=== response state :%zi ",state);
                                
                                //可以根据回调提示用户。
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                                                    message:nil
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed"
                                                                                    message:[NSString stringWithFormat:@"Error Description：%@",[error errorDescription]]
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"OK"
                                                                          otherButtonTitles:nil, nil];
                                    [alert show];
                                }
                            }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
