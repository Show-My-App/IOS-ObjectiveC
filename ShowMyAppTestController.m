//
//  ShowMyAppController.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import "ShowMyAppTestController.h"

@interface ShowMyAppTestController ()

@end

@implementation ShowMyAppTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ShowMyAppInstance InsertFullURL:textURL];
    [ShowMyAppInstance InsertTinyURL:textTinyURL];
    [ShowMyAppInstance InsertFullQRCode:imageQRCode];
    [ShowMyAppInstance InsertTinyQRCode:imageTinyQRCode];
}

- (void)Install:(ShowMyApp*) sShowMyAppInstance {
    ShowMyAppInstance = sShowMyAppInstance;
}

-(IBAction)ShareFull:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Share:self Message:@"Try this App!"];
    }
}

-(IBAction)ShareTiny:(id)sender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareTiny:self Message:@"Try this App!"];
    }
}

-(IBAction)ShareFullQRCode:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareFullQRCode:self];
    }
}

-(IBAction)ShareTinyQRCode:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareTinyQRCode:self];
    }
}

-(IBAction)ShareInWebBrowser {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareInWebBrowser];
    }
}

@end
