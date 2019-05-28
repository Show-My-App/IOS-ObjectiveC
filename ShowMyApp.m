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

@synthesize AppName;
@synthesize Design;
@synthesize DesignColor;
@synthesize DesignColorBackground;
@synthesize tiny;
@synthesize oneIconOnly;
@synthesize ReferencedUser;
@synthesize ReccordID;
@synthesize iOS_iPhone_BundleID;
@synthesize iOS_iPad_BundleID;
@synthesize macOS_BundleID;
@synthesize tvOS_BundleID;
@synthesize android_BundleID;
@synthesize android_Tablet_BundleID;
@synthesize windows_BundleID;
@synthesize windows_Phone_BundleID;
@synthesize steam_BundleID;

-(NSString*)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

-(NSString*) GetParam {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSMutableArray *tURL = [[NSMutableArray alloc] init];
    if (ReferencedUser == false)
    {
        if ([AppName length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"n=%@",AppName]];
        }
        [tURL addObject:[NSString stringWithFormat:@"d=%@",[@(Design) stringValue]]];
        if (DesignColor!=nil)
        {
            [tURL addObject:[NSString stringWithFormat:@"c=%@",[self hexStringFromColor:DesignColor]]];
        }
        if (DesignColorBackground!=nil)
        {
            [tURL addObject:[NSString stringWithFormat:@"k=%@",[self hexStringFromColor:DesignColorBackground]]];
        }
        if (oneIconOnly==true)
        {
            [tURL addObject:@"i=1"];
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
            [tURL addObject:[NSString stringWithFormat:@"v=%@",tvOS_BundleID]];
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
    }
    else
    {
        if ([ReccordID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"s=%@",ReccordID]];
        }
    }
    return [tURL componentsJoinedByString:@"&"];
}

-(NSURL*)CreateURL {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"r.php?", [self GetParam]]];
}

-(void)GetURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self GetTinyURL:sBlock];
    }
    else
    {
        [self GetFullURL:sBlock];
    }
}
-(void)GetFullURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    sBlock([self CreateURL]);
}

-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"url.php?t=1&", [self GetParam]]];
    [ShowMyAppRequestURL createDownloadForURL:tURL withBlock:sBlock];
}

-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self GetTinyQRCode:sBlock];
    }
    else
    {
        [self GetFullQRCode:sBlock];
    }
}

-(void)GetFullQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"qrcode.php?", [self GetParam]]];
    [ShowMyAppRequestQRCode createDownloadForURL:tURL withBlock:sBlock];
}

-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"qrcode.php?t=1&", [self GetParam]]];
    [ShowMyAppRequestQRCode createDownloadForURL:tURL withBlock:sBlock];
}

-(void)InsertURL:(UILabel *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self InsertTinyURL:sLabel];
    }
    else
    {
        [self InsertFullURL:sLabel];
    }
}

-(void)InsertFullURL:(UILabel *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [sLabel setText:[[self CreateURL] absoluteString]];
}

-(void)InsertTinyURL:(UILabel *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyURL: ^(NSURL *sURL){
        [sLabel setText:[sURL absoluteString]];
    }];
}


-(void)InsertQRCode:(UIImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self InsertTinyQRCode:sImageView];
    }
    else
    {
        [self InsertFullQRCode:sImageView];
    }
}

-(void)InsertFullQRCode:(UIImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetFullQRCode: ^(UIImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)InsertTinyQRCode:(UIImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyQRCode: ^(UIImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)Share:(UIViewController *)sParentController {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self ShareTiny:sParentController];
    }
    else
    {
        [self ShareFull:sParentController];
    }
}

-(void)ShareFull:(UIViewController *)sParentController {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",Message,[[self CreateURL] absoluteString]], nil];
    UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
    [tShareController setCompletionWithItemsHandler:^(UIActivityType  _Nullable activityType, BOOL completed, NSArray * _Nullable returnedItems, NSError * _Nullable activityError) {
    }];
    [sParentController presentViewController:tShareController animated:true completion:nil];
}

-(void)ShareTiny:(UIViewController *)sParentController {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyURL: ^(NSURL *sURL){
        NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",self->Message,[sURL absoluteString]], nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
}

-(void)ShareFullQRCode:(UIViewController *)sParentController {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetFullQRCode:^(UIImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
}

-(void)ShareTinyQRCode:(UIViewController *)sParentController {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyQRCode: ^(UIImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        UIActivityViewController *tShareController = [[UIActivityViewController alloc] initWithActivityItems:tShared applicationActivities:NULL];
        [sParentController presentViewController:tShareController animated:true completion:nil];
    }];
}

-(void)ShareInWebBrowser {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [[UIApplication sharedApplication] openURL:[self CreateURL]];
}

-(void)Powered {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [[UIApplication sharedApplication] openURL:[[NSURL alloc] initWithString:website]];
}
@end
