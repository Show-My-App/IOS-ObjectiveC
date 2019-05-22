//
//  ShowMyAppRequestQRCode.h
//  show-my-app
//
//  Created by JFC idéMobi on 22/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShowMyAppRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ShowMyAppBlockQRCode)(UIImage *sQRCode);

@interface ShowMyAppRequestQRCode : NSObject <ShowMyAppRequestDelegate> {
    ShowMyAppRequest *downloadRequest;
    ShowMyAppBlockQRCode downloadBlock;
}
+(ShowMyAppRequestQRCode*)createDownloadForURL:(NSURL*)sUrl withBlock:(ShowMyAppBlockQRCode)sBlock;
@end

NS_ASSUME_NONNULL_END
