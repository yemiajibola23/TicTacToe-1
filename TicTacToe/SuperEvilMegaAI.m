//
//  SuperEvilMegaAI.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "SuperEvilMegaAI.h"

@interface SuperEvilMegaAI()

@property int move;
@property NSArray *winningBoards3x3;


@end

@implementation SuperEvilMegaAI

- (instancetype)init
{
    self = [super init];
    if (self) {
        _winningBoards3x3 = @[@"###------",
                           @"---###---",
                           @"------###",
                           @"#--#--#--",
                           @"-#--#--#-",
                           @"--#--#--#",
                           @"#---#---#",
                           @"--#-#-#--"];
    }
    return self;
}

-(int)makeMove:(NSString*)board {
    
    if (![self canWin]) {
        
        if (![self canBlock]) {
            
            if (![self canFork]) {
                
                //Play Random Move
                
            }
            
        }
        
    }
    
    //Return grid spot to play
    return _move;
}

-(BOOL)canWin {
    return NO;
}

-(BOOL)canBlock {
    return NO;
}

-(BOOL)canFork {
    return NO;
}

-(BOOL)checkForWin:(NSString *)board {
    
    int threeInARow = 0;
        //Check Each win board
    for (NSString *winBoard in _winningBoards3x3) {
            //Chack each grid spot in the board
        for (int i = 0; i < 9; i++) {
            if ([winBoard characterAtIndex:i] == '#' && [board characterAtIndex:i] == _myToken) {
                threeInARow++;
            }
        }
        
        if (threeInARow == 3) {
            return YES;
        }
        
    }
    
    return NO;
    
}

@end
