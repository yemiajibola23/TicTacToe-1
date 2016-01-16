//
//  GameViewController.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "GameViewController.h"
#import "DraggableImageView.h"
#import "SuperEvilMegaAI.h"


@interface GameViewController ()

@property (weak, nonatomic) IBOutlet GridSpot *gridSpot0;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot1;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot2;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot3;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot4;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot5;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot6;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot7;
@property (weak, nonatomic) IBOutlet GridSpot *gridSpot8;
@property (weak, nonatomic) IBOutlet DraggableImageView *draggableToken;

@property SuperEvilMegaAI *HAL;

@property NSArray *gridSpots;
@property NSArray *winningBoards3x3;
@property NSMutableString *board;
@property char playerToken;
@property int gameMode;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBoard];
    //NSLog(@"X turn");
}



#pragma mark Movement

-(void)movePlaced:(GridSpot*)gridSpot byPlayer:(char)player {
    
    //NSLog(@"%@  %i  %c",_board, [gridSpot gridSpotID], [gridSpot token]);
    [_board replaceCharactersInRange:NSMakeRange([gridSpot gridSpotID], 1) withString:[NSString stringWithFormat:@"%c",[gridSpot token]]];
    //NSLog(@"%@  %i  %c",_board, [gridSpot gridSpotID], [gridSpot token]);
    //NSLog(@"%c's turn!",player == 'x' ? 'o' : 'x');
    
    if ([self checkForWinner]) {
        return;
    }
    if (player == _playerToken) {
        [self placeAIMoveAtIndex:[_HAL makeMove:_board]];
    }
}

-(void)placeAIMoveAtIndex:(int)index {
    NSLog(@"HAL makes move at %i",index);
    
    [_draggableToken animateToGridSpot:[_gridSpots objectAtIndex:index]];
    
//    [UIView animateWithDuration:0.3 animations:^{
//        [_draggableToken setFrame:[[_gridSpots objectAtIndex:index] boundsInSuperView]];
//    } completion:^(BOOL finished) {
//        [_draggableToken drop];
//        [self movePlaced:[_gridSpots objectAtIndex:index] byPlayer:_playerToken == 'x' ? 'o' : 'x'];
//    }];
    
}

#pragma mark Win Checking and Handle

-(BOOL)checkForWinner {
    
    int boardIndex = 0;
    int countX[8] = {0,0,0,0,0,0,0,0};
    int countO[8] = {0,0,0,0,0,0,0,0};
    for (NSString *winBoard in _winningBoards3x3) {
        
        for (int i = 0; i < 9; i++) {
            if ( [winBoard characterAtIndex:i] == '#' ) {
                
                if ([_board characterAtIndex:i] == 'x' ) {
                    countX[boardIndex]++;
                } else if ([_board characterAtIndex:i] == 'o' ) {
                    countO[boardIndex]++;
                }
            }
        }
        boardIndex++;
    }
    
    for (int i = 0; i < 8; i++) {
        if (countX[i] == 3) {
            [self proclaimWinner:@"X" winningBoard:[_winningBoards3x3 objectAtIndex:i] draw:NO];
            return YES;
        } else if( countO[i] == 3) {
            [self proclaimWinner:@"O" winningBoard:[_winningBoards3x3 objectAtIndex:i] draw:NO];
            return YES;
        }
    }
    
    if (![_board containsString:@"-"]) {
        [self proclaimWinner:@"" winningBoard:_board draw:YES];
        return YES;
    }
    
    return NO;
}

-(void)proclaimWinner:(NSString *)winner winningBoard:(NSString *)board draw:(BOOL)draw {
    [_draggableToken setHidden:YES];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DRAW!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Main Menu" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[self navigationController] popToRootViewControllerAnimated:YES];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self setupBoard];
    }]];
    
    if (!draw) {
        NSLog(@"%@ Wins! %@",winner,board);
        for (int x = 0; x < 9; x++) {
            if ([board characterAtIndex:x] == '#') {
                [_gridSpots[x] highlightWithColor:[UIColor whiteColor]];
            }
        }
        
        [alert setTitle:[NSString stringWithFormat:@"%@ WINS!",winner]];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        NSLog(@"DRAW.. %@",board);
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}


#pragma mark Setup

-(void)setupBoard {
    _board = [NSMutableString stringWithString: @"---------"];
    _gridSpots = [[NSArray alloc] initWithObjects:_gridSpot0,_gridSpot1,_gridSpot2,
                                                  _gridSpot3,_gridSpot4,_gridSpot5,
                                                  _gridSpot6,_gridSpot7,_gridSpot8, nil];
    for (int i = 0; i < [_gridSpots count]; i++) {
        [_gridSpots[i] setGridSpotID:i];
        [_gridSpots[i] resetImage];
    }
    [_draggableToken setup:_gridSpots gameVC:self];
    
    _winningBoards3x3 =  @[@"###------",
                           @"---###---",
                           @"------###",
                           @"#--#--#--",
                           @"-#--#--#-",
                           @"--#--#--#",
                           @"#---#---#",
                           @"--#-#-#--"];

    UIAlertController *tokenChoose = [UIAlertController alertControllerWithTitle:@"Choose your token" message:@"X goes first, and O second" preferredStyle:UIAlertControllerStyleAlert];
    
    [tokenChoose addAction:[UIAlertAction actionWithTitle:@"X" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _playerToken = 'x';
        [_HAL setMyToken:'o'];
    }]];
    
    [tokenChoose addAction:[UIAlertAction actionWithTitle:@"O" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _playerToken = 'o';
        [_HAL setMyToken:'x'];
        [self placeAIMoveAtIndex:[_HAL makeMove:_board]];
        
    }]];
    
    [tokenChoose addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [[self navigationController] popToRootViewControllerAnimated:YES];
    }]];
    
    
    switch (_gameMode) {
        case 0:
            //One Player
            _HAL = [[SuperEvilMegaAI alloc]init];
            [self presentViewController:tokenChoose animated:YES completion:nil];
            
            break;
        case 1:
            //Two Player
            
            break;
        case 2:
            //Online
            
            break;
            
        default:
            break;
    }
}

- (IBAction)onResetTapped:(id)sender {
    [self setupBoard];
}

-(void)gameMode:(int)mode {
    _gameMode = mode;
}


@end
