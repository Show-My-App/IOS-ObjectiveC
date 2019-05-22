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
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance InsertQRCode:imageQRCode];
    }
}

- (void)Install:(ShowMyApp*) sShowMyAppInstance {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    ShowMyAppInstance = sShowMyAppInstance;
}

-(IBAction)Share:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Share:self Message:@"Try this App!"];
    }
}

-(IBAction)ShareClose:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)Powered:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Powered];
    }
}

@end
