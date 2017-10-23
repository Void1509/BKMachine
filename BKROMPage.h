//
//  BKROMPage.h
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKMemPage.h"

@interface BKROMPage : BKMemPage
- (id)initWithROMData:(voidPtr) data;
- (void)writeToAddrB:(u_short) addr data:(u_short)data;
- (void)writeToAddrW:(u_short) addr data:(u_short)data;
@end
