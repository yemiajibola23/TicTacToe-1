//
//  GameViewController.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "GameViewController.h"
#import "DraggableImageView.h"
#import "GridSpot.h"
#import "SuperEvilMegaAI.h"

@interface GameViewController ()

@property (weak, nonatomic) IBOutlet DraggableImageView *placeablePlayerMark;

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

@property NSArray *gridSpots;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _gridSpots = [[NSArray alloc] initWithObjects:_gridSpot0,_gridSpot1,_gridSpot2,
                                                  _gridSpot3,_gridSpot4,_gridSpot5,
                                                  _gridSpot6,_gridSpot7,_gridSpot8, nil];
    for (int i = 0; i < [_gridSpots count]; i++) {
        [_gridSpots[i] setGridSpotID:i];
    }
    [_draggableToken setup:_gridSpots];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movePlaced) name:@"Move Placed" object:nil];
}

-(void)movePlaced {
    NSLog(@"move placed!"); 
    
    [self checkForWinner];
    
}

-(void)checkForWinner {
    
    
    
}

@end
