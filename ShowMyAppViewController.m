//
//  ShowMyAppViewController.m
//  show-my-app
//
//  Created by JFC idéMobi on 21/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import "ShowMyAppViewController.h"

@interface ShowMyAppViewController ()

@end

@implementation ShowMyAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([ShowMyAppInstance IsTiny] == false)
    {
        [ShowMyAppInstance InsertQRCode:imageQRCode];
    }
    else
    {
        [ShowMyAppInstance InsertTinyQRCode:imageQRCode];
    }
}

- (void)Install:(ShowMyApp*) sShowMyAppInstance {
    ShowMyAppInstance = sShowMyAppInstance;
}

-(IBAction)Share:(id)sSender {
    if (ShowMyAppInstance!=NULL)
    {
        if ([ShowMyAppInstance IsTiny] == false)
        {
            [ShowMyAppInstance Share:self Message:@"Try this App!"];
        }
        else
        {
            [ShowMyAppInstance ShareTiny:self Message:@"Try this App!"];
        }
    }
}

-(IBAction)ShareClose:(id)sSender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
