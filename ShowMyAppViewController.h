//
//  ShowMyAppViewController.h
//  show-my-app
//
//  Created by JFC idéMobi on 21/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowMyApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowMyAppViewController : UIViewController {
    ShowMyApp *ShowMyAppInstance;
    IBOutlet UIImageView *imageQRCode;
}

-(void)Install:(ShowMyApp*) sShowMyAppInstance;
-(IBAction)Share:(id)sSender;
-(IBAction)ShareClose:(id)sSender;

@end

NS_ASSUME_NONNULL_END
