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
@property NSArray *winningBoards;
@property NSMutableString *board;
@property NSMutableArray *winning3;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBoard];
    _winningBoards = @[@"###------",
                       @"---###---",
                       @"------###",
                       @"#--#--#--",
                       @"-#--#--#-",
                       @"--#--#--#",
                       @"#---#---#",
                       @"--#-#-#--"];
}

-(void)movePlaced:(GridSpot*)gridSpot {    
    [_board replaceCharactersInRange:NSMakeRange([gridSpot gridSpotID], 1) withString:[NSString stringWithFormat:@"%c",[gridSpot token]]];
    [self checkForWinner];
}

-(void)checkForWinner {
    
    int boardIndex = 0;
    int countX[8] = {0,0,0,0,0,0,0,0};
    int countO[8] = {0,0,0,0,0,0,0,0};
    for (NSString *winBoard in _winningBoards) {
        
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
            [self proclaimWinner:@"X" winningBoard:[_winningBoards objectAtIndex:i] draw:NO];
            return;
        } else if( countO[i] == 3) {
            [self proclaimWinner:@"O" winningBoard:[_winningBoards objectAtIndex:i] draw:NO];
            return;
        }
    }
    
    if (![_board containsString:@"-"]) {
        [self proclaimWinner:@"" winningBoard:_board draw:YES];
    }
}

-(void)proclaimWinner:(NSString *)winner winningBoard:(NSString *)board draw:(BOOL)draw {
    [_draggableToken setHidden:YES];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"DRAW!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Main Menu" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
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
    _winning3 = [NSMutableArray arrayWithArray:@[]];
}

- (IBAction)onResetTapped:(id)sender {
    [self setupBoard];
}

-(void)gameMode:(int)mode {
    switch (mode) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
            
        default:
            break;
    }
}


@end
