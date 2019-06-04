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

+(ShowMyAppViewController*)CreateViewController:(ShowMyApp*) sShowMyApp {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    ShowMyAppViewController *rShowMyAppViewController = [[ShowMyAppViewController alloc] initWithNibName:@"ShowMyAppViewController" bundle:[NSBundle mainBundle]];
    [rShowMyAppViewController Install:sShowMyApp];
    [rShowMyAppViewController setTitle:@"Share me"];
    return rShowMyAppViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (ShowMyAppInstance!=NULL)
    {
        self.view.backgroundColor = [ShowMyAppInstance DesignColorBackground];
        
        [imageIcon setBackgroundColor:[ShowMyAppInstance DesignColor]];
        [imageIcon setTintColor:[ShowMyAppInstance DesignColorBackground]];
        [imageIcon setImage:[[imageIcon image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
        
        [imageQRCode setBackgroundColor:[ShowMyAppInstance DesignColor]];
        [imageQRCode setTintColor:[ShowMyAppInstance DesignColorBackground]];
        
        [imageQRCodeOverlay setBackgroundColor:[ShowMyAppInstance DesignColorBackground]];
        [imageQRCodeOverlay setTintColor:[ShowMyAppInstance DesignColor]];
        [imageQRCodeOverlay setImage:[[imageQRCodeOverlay image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    
        [ShareLinkButton setBackgroundColor:[ShowMyAppInstance DesignColorBackground]];
        [ShareLinkButton setTintColor:[ShowMyAppInstance DesignColor]];
        [ShareLinkButton setImage:[[ShareLinkButton imageForState:UIControlStateNormal] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        
//         QRCodeArea;
        
        QRCodeTitleLabel.textColor = [ShowMyAppInstance DesignColor];
        QRCodeTitleLabel.backgroundColor = [ShowMyAppInstance DesignColorBackground];
        LinkTitleLabel.textColor = [ShowMyAppInstance DesignColor];
        LinkTitleLabel.backgroundColor = [ShowMyAppInstance DesignColorBackground];
        
        [PoweredButton setTitleColor:[ShowMyAppInstance DesignColorBackground] forState:UIControlStateNormal];
        PoweredButton.backgroundColor = [ShowMyAppInstance DesignColor];
        
        [CloseButton setTitleColor:[ShowMyAppInstance DesignColor] forState:UIControlStateNormal];
        CloseButton.backgroundColor = [ShowMyAppInstance DesignColorBackground];
      
        [ShowMyAppInstance InsertQRCode:imageQRCode];
        
//        [QRCodeArea setTranslatesAutoresizingMaskIntoConstraints:NO];
        [QRCodeArea setTransform:CGAffineTransformMakeRotation(M_PI_4)];
        [self rotateImageView];
    }
}

- (void)rotateImageView
{
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [[QRCodeArea superview] setNeedsLayout];
    [UIView animateWithDuration:60 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        NSLog(@" %s line %d",__FUNCTION__, __LINE__);
//        [[self->QRCodeArea layer] setTransform:CATransform3DRotate(CATransform3DIdentity, M_PI_2, 0, 0, 1)];
//        [self->QRCodeArea setTransform:CGAffineTransformRotate(self->QRCodeArea.transform,M_PI)];
//        [[self->QRCodeArea superview] layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (finished) {
            NSLog(@" %s line %d",__FUNCTION__, __LINE__);
            [self rotateImageView];
        }
    }];
}

- (void)Install:(ShowMyApp*) sShowMyAppInstance {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    ShowMyAppInstance = sShowMyAppInstance;
}

-(IBAction)Share:(id)sSender {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Share:self];
    }
}

-(IBAction)ShareClose:(id)sSender {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)Powered:(id)sSender {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (ShowMyAppInstance!=NULL)
    {
        [ShowMyAppInstance Powered];
    }
}

@end
