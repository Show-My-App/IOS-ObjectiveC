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
    [ShowMyAppInstance InsertURL:textURL];
    [ShowMyAppInstance InsertTinyURL:textTinyURL];
    [ShowMyAppInstance InsertQRCode:imageQRCode];
    [ShowMyAppInstance InsertTinyQRCode:imageTinyQRCode];
}

- (void)Install:(ShowMyApp*) sShowMyAppInstance {
    ShowMyAppInstance = sShowMyAppInstance;
}

-(IBAction)Share:(id)sSender {
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Share:self Message:@"Try this App!"];
    }
}

-(IBAction)ShareTiny:(id)sender {
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareTiny:self Message:@"Try this App!"];
    }
}

-(IBAction)ShareQRCode:(id)sSender {
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareQRCode:self];
    }
}

-(IBAction)ShareTinyQRCode:(id)sSender {
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareTinyQRCode:self];
    }
}

-(IBAction)ShareClose:(id)sSender {
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(IBAction)ShareInWebBrowser {
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance ShareInWebBrowser];
    }
}
@end
