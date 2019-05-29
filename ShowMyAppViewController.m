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
        
        [imageQRCode setBackgroundColor:[ShowMyAppInstance DesignColorBackground]];
        [imageQRCode setTintColor:[ShowMyAppInstance DesignColor]];
        
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
        
        
//        // Setup the animation
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:60];
//        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//
//        // The transform matrix
//        CGAffineTransform transform = CGAffineTransformMakeRotation(2*M_PI);
//        QRCodeArea.transform = transform;
//
//        // Commit the changes
//        [UIView commitAnimations];
        
//        [QRCodeArea setAutoresizesSubviews:NO];
//        QRCodeArea.alpha = 1.0;
//        [UIView animateWithDuration:20
//                         animations:^{QRCodeArea.alpha = 0.0;}
//                         completion:^(BOOL finished){ [QRCodeArea removeFromSuperview]; }];
//        [self rotateImageView];
        
//        [imageQRCode setAutoresizingMask:UIViewAutoresizingNone];
//        [QRCodeArea setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
//        imageQRCode.transform = CGAffineTransformRotate(imageQRCode.transform , -M_PI/2.0);
//        [self runSpinAnimationOnView:QRCodeArea duration:60 repeat:true];
    }
}

- (void)rotateImageView
{
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [UIView animateWithDuration:60 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        NSLog(@" %s line %d",__FUNCTION__, __LINE__);
//        [self->QRCodeArea setTransform:CGAffineTransformRotate(self->QRCodeArea.transform, M_PI_2)];
//        [self->QRCodeArea setTransform:CGAffineTransformRotate(CGAffineTransformIdentity, M_PI_2)];
//        [[self->QRCodeArea superview] layoutIfNeeded];
//        [[self view] layoutIfNeeded];
        [self->QRCodeArea setTransform:CGAffineTransformTranslate(self->QRCodeArea.transform,320,320)];
    }completion:^(BOOL finished){
        if (finished) {
            NSLog(@" %s line %d",__FUNCTION__, __LINE__);
            [self rotateImageView];
        }
    }];
}

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration repeat:(float)repeat {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithInt:0];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat ? HUGE_VALF : 0;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
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
