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
    
    //NSLog(@"HAL's token is %c",_myToken);
    
    if (![self can:_myToken WinWith:board]) {
        
        if (![self can:(_myToken == 'x' ? 'o' : 'x') WinWith:board]) {
            
            if (![self canFork]) {
                
                //Play Random Move
                [self randomMoveWith:board];
                
            }
            
        }
        
    }
    
    //Return grid spot to play
    return _move;
}

-(void)randomMoveWith:(NSString *)board {
    int openSpaces[9] = {'-','-','-','-','-','-','-','-','-'};
    for (int i = 0; i <9; i++) {
        if ([board characterAtIndex:i] == '-') {
            openSpaces[i] = i;
        }
        //Pick a corner if advailable
        switch (openSpaces[i]) {
            case 0:
                _move = 0;
                break;
            case 2:
                _move = 2;
                break;
            case 6:
                _move = 6;
                break;
            case 8:
                _move = 8;
                break;
            default:
                break;
        }
    }
    
}

-(BOOL)can:(char)token WinWith:(NSString *)board {
    
    
    for (NSString *winBoard in _winningBoards3x3) {
        int rowCount = 0;
        for (int i = 0; i < 9; i++) {
            
            if ([winBoard characterAtIndex:i] == '#') {
                if ([board characterAtIndex:i] == token) {
                    rowCount = rowCount + 2;
                } else if ([board characterAtIndex:i] == '-'){
                    rowCount++;
                    
                }
                
            }
            
        }
       // NSLog(@"%i",rowCount);
        if (rowCount == 5) {
            //Can win!
            for (int i = 0; i < 9; i++) {
                
                if ([winBoard characterAtIndex:i] == '#') {
                   if ([board characterAtIndex:i] == '-'){
                       NSLog(@"Winning Move: %i",i);
                       _move = i;
                       break;
                    }
                    
                }
                
            }
            return YES;
        }
    }
    
    return NO;
}

-(BOOL)canFork {
    //uhhhhhh
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
