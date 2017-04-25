//
//  DoxDialerCaller.m
//  CallWithDoxDialer
//
//  Created on 4/25/17.
//  Copyright © 2017 Doximity. All rights reserved.
//

#import "DoxDialerCaller.h"
#import <UIKit/UIKit.h>

#pragma mark - Private Interface -
@interface DoxDialerCaller() {
    NSURL *_dialerSchemeURL;
    NSURL *_openDialerInAppStoreURL;
}
@property (nonnull, readonly) NSURL *dialerSchemeURL;
@property (nonnull, readonly) NSURL *openDialerInAppStoreURL;
@property (readonly) BOOL isDialerInstalled;
@end

#pragma mark - Implementaion -
@implementation DoxDialerCaller


#pragma mark Lazy Properties

-(nonnull NSURL *)dialerSchemeURL {
    if(!_dialerSchemeURL) {
        _dialerSchemeURL = [NSURL URLWithString:@"DoximityDialer://"];
    }
    return _dialerSchemeURL;
}

-(nonnull NSURL *)openDialerInAppStoreURL {
    if(!_openDialerInAppStoreURL) {
        _openDialerInAppStoreURL = nil;
    }
    return _openDialerInAppStoreURL;
}


#pragma mark Private Helpers

-(BOOL)isDialerInstalled {
    return [UIApplication.sharedApplication canOpenURL:self.dialerSchemeURL];
}


#pragma mark Publically Available Method

-(void)dialPhoneNumber:(nonnull NSString *)phoneNumber {
    if (self.isDialerInstalled) {
        NSString *urlEscapedPhoneNumber = [phoneNumber stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
        NSURL *launchDialerURL = [NSURL URLWithString:[NSString stringWithFormat:@"/call?targetNumber=%@", urlEscapedPhoneNumber]
                                        relativeToURL:self.dialerSchemeURL];
        [UIApplication.sharedApplication openURL:launchDialerURL];
    }
    else {
        [UIApplication.sharedApplication openURL:self.openDialerInAppStoreURL];
    }
}




@end
