//
//  Show-My-App.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ShowMyAppRequest.h"

typedef void(^ShowMyAppBlockQRCode)(UIImage *sQRCode);
typedef void(^ShowMyAppBlockURL)(NSURL *sURL);

@interface ShowMyApp : NSObject <ShowMyAppRequestDelegate>{
    NSString *AppName; // &n=xxxxx
    NSString *Design; // &d=xxxxx
    NSString *Color; // &c=#XXXXXX
    NSString *ColorBackground; // &k=#XXXXXX
    
    NSString *iOS_iPhone_BundleID; // &a=xxxxx
    NSString *iOS_iPad_BundleID; // &b=xxxxx
    NSString *macOS_BundleID; // &m=xxxxx
    NSString *tvOS_BundleID; // &v=xxxxx
    
    NSString *android_BundleID;  // &g=xxxxx
    NSString *android_Tablet_BundleID;  // &h=xxxxx
    
    NSString *windows_BundleID;  // &w=xxxxx
    NSString *windows_Phone_BundleID;  // &x=xxxxx
    
    NSString *steam_BundleID;  // &s=xxxxx
    
    ShowMyAppRequest *downloadTinyURL;
    ShowMyAppRequest *downloadTinyQRCode;
    ShowMyAppRequest *downloadQRCode;
    
    NSString *tinyURL;
    UIImage *QRCode;
    UIImage *tinyQRCode;
    
    ShowMyAppBlockURL tinyURLBlock;
    ShowMyAppBlockQRCode tinyQRCodeBlock;
    ShowMyAppBlockQRCode QRCodeBlock;
    
    bool tiny; // &t=0/1
}

@property (nonatomic, strong) NSString *AppName;
@property (nonatomic, strong) NSString *Design;
@property (nonatomic, strong) NSString *iOS_iPhone_BundleID;
@property (nonatomic, strong) NSString *iOS_iPad_BundleID;
@property (nonatomic, strong) NSString *macOS_BundleID;
@property (nonatomic, strong) NSString *tvOS_BundleID;

@property (nonatomic, strong) NSString *android_BundleID;
@property (nonatomic, strong) NSString *android_Tablet_BundleID;

@property (nonatomic, strong) NSString *windows_BundleID;
@property (nonatomic, strong) NSString *windows_Phone_BundleID;

@property (nonatomic, strong) NSString *steam_BundleID;
@property (nonatomic) bool tiny;

-(NSURL*)CreateURL;
-(bool)IsTiny;
-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock;
-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)InsertURL:(UILabel *)sLabel;
-(void)InsertTinyURL:(UILabel *)sLabel;
-(void)InsertQRCode:(UIImageView *)sImageView;
-(void)InsertTinyQRCode:(UIImageView *)sImageView;
-(void)Share:(UIViewController *)sParentController Message:(NSString*) sMessage;
-(void)ShareTiny:(UIViewController *)sParentController Message:(NSString*) sMessage;
-(void)ShareQRCode:(UIViewController *)sParentController;
-(void)ShareTinyQRCode:(UIViewController *)sParentController;
-(void)ShareInWebBrowser;
@end
