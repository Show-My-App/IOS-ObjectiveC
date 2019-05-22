//
//  ShowMyAppController.h
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowMyApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowMyAppTestController : UIViewController {
    ShowMyApp *ShowMyAppInstance;
    
    IBOutlet UILabel *textURL;
    IBOutlet UILabel *textTinyURL;
    IBOutlet UIImageView *imageQRCode;
    IBOutlet UIImageView *imageTinyQRCode;
}
-(void)Install:(ShowMyApp*) sShowMyAppInstance;
-(IBAction)Share:(id)sSender;
-(IBAction)ShareTiny:(id)sSender;
-(IBAction)ShareQRCode:(id)sSender;
-(IBAction)ShareTinyQRCode:(id)sSender;
-(IBAction)ShareClose:(id)sSender;
-(IBAction)ShareInWebBrowser;
@end

NS_ASSUME_NONNULL_END
