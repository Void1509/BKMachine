//
//  BKMemPage.h
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKMemPage : NSObject {
    u_char      *b_data;
    u_short     *w_data;
}
- (id)initWithCapacity16:(BOOL) is16;
- (void)writeToAddrB:(u_short) addr data:(u_short)data;
- (void)writeToAddrW:(u_short) addr data:(u_short)data;
- (u_short)readFromAddrB:(u_short) addr;
- (u_short)readFromAddrW:(u_short) addr;
- (u_char*)getVideo;
@end
