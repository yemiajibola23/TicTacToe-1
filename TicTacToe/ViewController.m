//
//  ViewController.m
//  TicTacToe
//
//  Created by Jonathan Jones on 1/14/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property NSString *player;
@property NSArray *grid;
@property NSString *whoWon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = self.whichPlayerLabel.text;
    self.grid = @[self.buttonOne,   self.buttonTwo,   self.buttonThree,
                  self.buttonFour,  self.buttonFive,  self.buttonSix,
                  self.buttonSeven, self.buttonEight, self.buttonNine];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
    [sender setTitle:self.player forState:UIControlStateNormal];
    [sender setEnabled:false];
    
    if ([_grid[0] isEqualToString:_grid[1]] && [_grid[0] isEqualToString:_grid[2]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[3]] && [_grid[4] isEqualToString:_grid[5]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[6]] && [_grid[7] isEqualToString:_grid[8]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[0]] && [_grid[4] isEqualToString:_grid[8]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[0]] && [_grid[3] isEqualToString:_grid[6]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[1]] && [_grid[4] isEqualToString:_grid[7]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[2]] && [_grid[5] isEqualToString:_grid[8]]){
        self.whoWon = self.player;
    } else if([_grid[0] isEqualToString:_grid[2]] && [_grid[4] isEqualToString:_grid[6]]){
        self.whoWon = self.player;
    }
    



    
    if ([self.player isEqualToString:@"X"]) {
        self.player = @"O";
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    } else {
        self.player = @"X";
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    }
    self.whichPlayerLabel.text = self.player;
}

@end
