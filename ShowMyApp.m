//
//  Show-My-App.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShowMyApp.h"

@implementation ShowMyApp

NSString *const website = @"https://www.show-my-app.com/";
NSString *const tinyTag = @"tiny=1&";

@synthesize AppName;
@synthesize Design;
@synthesize iOS_iPhone_BundleID;
@synthesize iOS_iPad_BundleID;
@synthesize macOS_BundleID;
@synthesize tvOS_BundleID;
@synthesize android_BundleID;
@synthesize android_Tablet_BundleID;
@synthesize windows_BundleID;
@synthesize windows_Phone_BundleID;
@synthesize steam_BundleID;
@synthesize tiny;
-(void)dealloc {
}

-(NSString*) GetParam {
    NSMutableArray *tURL = [[NSMutableArray alloc] init];
    if ([AppName length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"n=%@",AppName]];
    }
    if ([Design length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"y=%@",Design]];
    }
    if ([iOS_iPhone_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"a=%@",iOS_iPhone_BundleID]];
    }
    if ([iOS_iPhone_BundleID length]!=0)
    {
    [tURL addObject:[NSString stringWithFormat:@"a=%@",iOS_iPhone_BundleID]];
    }
    if ([iOS_iPad_BundleID length]!=0)
    {
        if ([iOS_iPad_BundleID isEqualToString:iOS_iPhone_BundleID] == false)
        {
            [tURL addObject:[NSString stringWithFormat:@"b=%@",iOS_iPad_BundleID]];
        }
    }
    if ([macOS_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"m=%@",macOS_BundleID]];
    }
    if ([tvOS_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"q=%@",tvOS_BundleID]];
    }
    if ([android_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"g=%@",android_BundleID]];
    }
    if ([android_Tablet_BundleID length]!=0)
    {
        if ([android_Tablet_BundleID isEqualToString:android_BundleID] == false)
        {
            [tURL addObject:[NSString stringWithFormat:@"h=%@",android_Tablet_BundleID]];
        }
    }
    if ([windows_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"w=%@",windows_BundleID]];
    }
    if ([windows_Phone_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"x=%@",windows_Phone_BundleID]];
    }
    if ([steam_BundleID length]!=0)
    {
        [tURL addObject:[NSString stringWithFormat:@"s=%@",steam_BundleID]];
    }
   return [tURL componentsJoinedByString:@"&"];
}

-(NSURL*)CreateURL {
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"r.php?", [self GetParam]]];
}

-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock {
        NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@", website, @"url.php?", tinyTag, [self GetParam]]];
        tinyURLBlock = sBlock;
        downloadTinyURL =  [ShowMyAppRequest createDownloadForURL:tURL withDelegate:self];
    }

-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock {
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"qrcode.php?", [self GetParam]]];
    QRCodeBlock = sBlock;
    downloadQRCode =  [ShowMyAppRequest createDownloadForURL:tURL withDelegate:self];
}

-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock {
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@", website, @"qrcode.php?", tinyTag, [self GetParam]]];
    tinyQRCodeBlock = sBlock;
    downloadTinyQRCode =  [ShowMyAppRequest createDownloadForURL:tURL withDelegate:self];
}

-(void)InsertURL:(UILabel *)sLabel {
    [sLabel setText:[[self CreateURL] absoluteString]];
}

-(void)InsertTinyURL:(UILabel *)sLabel {
    [self GetTinyURL: ^(NSURL *sURL){
        [sLabel setText:[sURL absoluteString]];
    }];
}

-(void)InsertQRCode:(UIImageView *)sImageView {
    [self GetQRCode: ^(UIImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)InsertTinyQRCode:(UIImageView *)sImageView {
    [self GetTinyQRCode: ^(UIImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)Share:(UIViewController *)sParentController Message:(NSString*) sMessage {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",sMessage,[[self CreateURL] absoluteString]], nil];
    UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
    [sParentController presentViewController:tShareController animated:true completion:nil];
}

-(void)ShareTiny:(UIViewController *)sParentController Message:(NSString*) sMessage {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyURL: ^(NSURL *sURL){
        NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",sMessage,[sURL absoluteString]], nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
}

-(void)ShareQRCode:(UIViewController *)sParentController {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetQRCode:^(UIImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
}

-(void)ShareTinyQRCode:(UIViewController *)sParentController {
        NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyQRCode: ^(UIImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
    }

-(void)DownloadObjectDelegateStart:(ShowMyAppRequest*)s_object {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

-(void)DownloadObjectDelegatePourcentage:(ShowMyAppRequest*)s_object pourcentage:(float)s_float {
     NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

-(void)DownloadObjectDelegateFinish:(ShowMyAppRequest*)s_object data:(NSData*)s_data {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (s_object == downloadTinyURL)
    {
        tinyURL = [[NSString alloc] initWithData:s_data encoding:NSUTF8StringEncoding];
        NSURL *tURL = [[NSURL alloc] initWithString:tinyURL];
        tinyURLBlock(tURL);
    }
    if (s_object == downloadTinyQRCode)
    {
        tinyQRCode = [[UIImage alloc] initWithData:s_data];
        tinyQRCodeBlock(tinyQRCode);
    }
    if (s_object == downloadQRCode)
    {
        QRCode = [[UIImage alloc] initWithData:s_data];
        QRCodeBlock(QRCode);
    }
}

-(void)DownloadObjectDelegateError:(ShowMyAppRequest*)s_object {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

-(void)ShareInWebBrowser {
    [[UIApplication sharedApplication] openURL:[self CreateURL]];
}

-(bool)IsTiny {
    return tiny;
}
 @end
