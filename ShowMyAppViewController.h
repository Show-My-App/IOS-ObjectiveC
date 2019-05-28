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
    IBOutlet UIImageView *imageQRCodeOverlay;
    IBOutlet UIImageView *imageIcon;
    IBOutlet UILabel *QRCodeTitleLabel;
    IBOutlet UILabel *LinkTitleLabel;
    IBOutlet UIButton *PoweredButton;
    IBOutlet UIButton *ShareLinkButton;
    IBOutlet UIView *QRCodeArea;
    IBOutlet UIButton *CloseButton;
}
+(ShowMyAppViewController*)CreateViewController:(ShowMyApp*) sShowMyApp;
-(void)Install:(ShowMyApp*) sShowMyAppInstance;
-(IBAction)Share:(id)sSender;
-(IBAction)ShareClose:(id)sSender;

@end

NS_ASSUME_NONNULL_END
