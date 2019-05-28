//
//  Show-My-App.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ShowMyAppRequestURL.h"
#import "ShowMyAppRequestQRCode.h"

@interface ShowMyApp : NSObject {
    NSString *Message;
    NSString *AppName; // &n=xxxxx
    NSInteger Design; // &d=xxxxx
    UIColor *DesignColor; // &c=#XXXXXX
    UIColor *DesignColorBackground; // &k=#XXXXXX
    bool tiny; // &t=0/1
    bool oneIconOnly; // &i=0/1
    
    bool ReferencedUser;
    NSString *ReccordID; // &r=#XXXXXX
    
    NSString *iOS_iPhone_BundleID; // &a=xxxxx
    NSString *iOS_iPad_BundleID; // &b=xxxxx
    NSString *macOS_BundleID; // &m=xxxxx
    NSString *tvOS_BundleID; // &v=xxxxx
    
    NSString *android_BundleID;  // &g=xxxxx
    NSString *android_Tablet_BundleID;  // &h=xxxxx
    
    NSString *windows_BundleID;  // &w=xxxxx
    NSString *windows_Phone_BundleID;  // &x=xxxxx
    
    NSString *steam_BundleID;  // &s=xxxxx
}

@property (nonatomic, strong) NSString *AppName;
@property (nonatomic) NSInteger Design;
@property (nonatomic, strong) UIColor *DesignColor;
@property (nonatomic, strong) UIColor *DesignColorBackground;
@property (nonatomic) bool tiny;
@property (nonatomic) bool oneIconOnly;

@property (nonatomic) bool ReferencedUser;
@property (nonatomic, strong) NSString *ReccordID;

@property (nonatomic, strong) NSString *iOS_iPhone_BundleID;
@property (nonatomic, strong) NSString *iOS_iPad_BundleID;
@property (nonatomic, strong) NSString *macOS_BundleID;
@property (nonatomic, strong) NSString *tvOS_BundleID;

@property (nonatomic, strong) NSString *android_BundleID;
@property (nonatomic, strong) NSString *android_Tablet_BundleID;

@property (nonatomic, strong) NSString *windows_BundleID;
@property (nonatomic, strong) NSString *windows_Phone_BundleID;

@property (nonatomic, strong) NSString *steam_BundleID;

-(void)GetURL:(ShowMyAppBlockURL) sBlock;
-(void)GetFullURL:(ShowMyAppBlockURL) sBlock;
-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock;

-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)GetFullQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock;

-(void)InsertURL:(UILabel *)sLabel;
-(void)InsertFullURL:(UILabel *)sLabel;
-(void)InsertTinyURL:(UILabel *)sLabel;

-(void)InsertQRCode:(UIImageView *)sImageView;
-(void)InsertFullQRCode:(UIImageView *)sImageView;
-(void)InsertTinyQRCode:(UIImageView *)sImageView;

-(void)Share:(UIViewController *)sParentController;
-(void)ShareFull:(UIViewController *)sParentController;
-(void)ShareTiny:(UIViewController *)sParentController;

-(void)ShareFullQRCode:(UIViewController *)sParentController;
-(void)ShareTinyQRCode:(UIViewController *)sParentController;

-(void)ShareInWebBrowser;
-(void)Powered;
@end
