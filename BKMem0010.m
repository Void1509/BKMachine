//
//  BKMem0010.m
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKMem0010.h"
#import "BKROMPage.h"

@implementation BKMem0010
- (id)init
{
    self = [super init];
// не работает    NSData *lRom = [NSData dataWithContentsOfFile:@"BASIC10.ROM"];
    NSData *lRom = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"BASIC10.ROM"]];
    if (!lRom) {return nil;}

    u_char *buf = (u_char*)[lRom bytes];
    BKROMPage *bas0 = [[BKROMPage alloc] initWithROMData:buf];
    BKROMPage *bas1 = [[BKROMPage alloc] initWithROMData:&buf[8192]];
    BKROMPage *bas2 = [[BKROMPage alloc] initWithROMData:&buf[16384]];
    self.sysrom = [NSArray arrayWithObjects:bas0,bas1,bas2, nil];
    [bas0 release];[bas1 release];[bas2 release];
    self.sysmem = [NSArray arrayWithObjects:[[BKMemPage alloc] initWithCapacity16:YES],
                   [[BKMemPage alloc] initWithCapacity16:YES],nil];
    return self;
}
- (void)dealloc
{
    self.sysrom = nil;
    self.sysmem = nil;
    [super dealloc];
}
-(u_short)getPort:(u_short) adr
{
    return 070707;
}
-(void)setPort:(u_short) adr data:(u_short) data
{
    return;
}
-(u_short)getAddrW:(u_short)addr
{
    u_short inx;
    if (addr & 0100000) {
        if ((addr & 0177400) == 0177400) return [self getPort:addr];
        inx = (addr & 060000) >> 13;
        return [[_sysrom objectAtIndex:inx] readFromAddrW:(addr & 017777)];
    } else {
        inx = (addr & 040000) >> 14;
        return [[_sysmem objectAtIndex:inx] readFromAddrW:(addr & 037777)];
    }
}
-(u_char)getAddrB:(u_short)addr
{
    u_short inx;
    if (addr & 0100000) {
        if ((addr & 0177400) == 0177400) return [self getPort:addr];
        inx = (addr & 060000) >> 13;
        return [[_sysrom objectAtIndex:inx] readFromAddrB:(addr & 017777)];
    } else {
        inx = (addr & 040000) >> 14;
        return [[_sysmem objectAtIndex:inx] readFromAddrB:(addr & 037777)];
    }
}
-(void)setAddrW:(u_short)addr data:(u_short)data
{
    u_short inx;
    if (addr & 0100000) {
        if ((addr & 0177400) == 0177400) {[self setPort:addr data:data];return;}
        inx = (addr & 060000) >> 13;
        return;
    } else {
        inx = (addr & 040000) >> 14;
        [[_sysmem objectAtIndex:inx] writeToAddrW:(addr & 037777) data:data];
        return;
    }
}
-(void)setAddrB:(u_short)addr data:(u_char)data
{
    u_short inx;
    if (addr & 0100000) {
        if ((addr & 0177400) == 0177400) {[self setPort:addr data:data];return;}
        inx = (addr & 060000) >> 13;
        return;
    } else {
        inx = (addr & 040000) >> 14;
        [[_sysmem objectAtIndex:inx] writeToAddrB:(addr & 037777) data:data];
        return;
    }
}

@end
