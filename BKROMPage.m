//
//  BKROMPage.m
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKROMPage.h"

@implementation BKROMPage
- (id)initWithROMData:(voidPtr) data
{
    self = [super initWithCapacity16:NO];
    memcpy(b_data, data, 8192);
    return self;
}
- (void)writeToAddrB:(u_short) addr data:(u_short)data
{
}
- (void)writeToAddrW:(u_short) addr data:(u_short)data
{
}

@end
