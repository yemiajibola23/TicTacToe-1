//
//  SuperEvilMegaAI.h
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    easy,
    medium,
    hard,
} Difficulty;

@interface SuperEvilMegaAI : NSObject

//Be afraid, very afraid

-(int)makeMove:(NSString*)board;

@end
