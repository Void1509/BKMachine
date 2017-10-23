//
//  BKSystem.h
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKSystem : NSObject {
    u_char sysID;
}
- (id)initWithSystem:(u_char) sys;
@end
