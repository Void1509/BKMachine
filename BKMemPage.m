//
//  BKMemPage.m
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKMemPage.h"

@implementation BKMemPage
- (id)initWithCapacity16:(BOOL) is16
{
    self = [super init];
    if (is16) {
        b_data = malloc(16384);
    } else {
        b_data = malloc(8192);
    }
    w_data = (u_short*)b_data;
    return self;
}
- (void)writeToAddrB:(u_short) addr data:(u_short)data
{
    u_char *ch;
    ch = (u_char*)&data;
    b_data[addr] = ch[0];
}
- (void)writeToAddrW:(u_short) addr data:(u_short)data
{
    w_data[(addr >> 1)] = data;
}
- (u_short)readFromAddrB:(u_short) addr
{
    return (u_short)b_data[addr];
}
- (u_short)readFromAddrW:(u_short) addr
{
    return w_data[(addr >> 1)];
}
- (u_char*)getVideo
{
    return b_data;
}
- (void)dealloc
{
    free(b_data);
    [super dealloc];
}
@end
