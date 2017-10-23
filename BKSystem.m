//
//  BKSystem.m
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#import "BKSystem.h"
#import "Defines.h"

@implementation BKSystem
- (u_char) initBK0010
{
    
    return BK_OK;
}
- (id)initWithSystem:(u_char) sys
{
    self = [super init];
    switch (sys) {
        case BK0010:
            sysID = sys;
            if (![self initBK0010]) return nil;
            break;
        case BK10MSTD:
            
            break;
        case BK10KGMD:
            
            break;
        case BK0011:
            
            break;
            
        default:
            sysID = BK0010;
            if (![self initBK0010]) return nil;
            break;
    }
    return self;
}
@end
