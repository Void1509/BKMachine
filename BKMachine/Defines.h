//
//  Defines.h
//  BKMachine
//
//  Created by Valeriy on 15.11.12.
//  Copyright (c) 2012 Valeriy. All rights reserved.
//

#ifndef BKMachine_Defines_h
#define BKMachine_Defines_h
// Экран
#define SCRW        683.0
#define SCRH        532.0
// Модели
#define BK0010      01
#define BK10MSTD    02
#define BK10KGMD    03
#define BK0011      10
// Статус и ошибки
#define BK_OK       1
#define BK_ERR      0
typedef union {
    u_short word;
    struct byte {
        u_char l;
        u_char h;
    };
}ADDRram;

#endif
