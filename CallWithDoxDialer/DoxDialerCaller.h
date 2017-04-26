//
//  DoxDialerCaller.h
//  CallWithDoxDialer
//
//  Created on 4/25/17.
//  Copyright © 2017 Doximity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoxDialerCaller : NSObject

+(id _Nonnull)shared;

-(void)dialPhoneNumber:(nonnull NSString *)phoneNumber;

@end
