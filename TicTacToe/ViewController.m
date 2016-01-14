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
    
    if ([[_grid[0] titleLabel].text isEqualToString:self.player]
        && [_grid[1] isEqualToString:self.player]
        && [[_grid[2] titleLabel].text isEqualToString:self.player]){
        self.whoWon = self.player;
        
    } else if([[_grid[3] titleLabel].text isEqualToString:self.player]
              && [_grid[4] isEqualToString:self.player]
              && [[_grid[5] titleLabel].text isEqualToString:self.player]){
        self.whoWon = self.player;
        
    } else if([[_grid[6] titleLabel].text isEqualToString:self.player]
              && [_grid[7] isEqualToString:self.player]
              && [[_grid[8] titleLabel].text isEqualToString:self.player]){
        self.whoWon = self.player;
        
    } else if([[_grid[0] titleLabel].text isEqualToString:self.player]
              && [_grid[4] isEqualToString:self.player]
              && [[_grid[8] titleLabel].text isEqualToString:self.player]){
        
        self.whoWon = self.player;
    } else if([[_grid[0] titleLabel].text isEqualToString:self.player]
              && [_grid[3] isEqualToString:self.player]
              && [[_grid[6] titleLabel].text isEqualToString:self.player]){
        
        self.whoWon = self.player;
    } else if([[_grid[1] titleLabel].text isEqualToString:self.player]
              && [_grid[4] isEqualToString:self.player]
              && [[_grid[7] titleLabel].text isEqualToString:self.player]){
        
        self.whoWon = self.player;
    } else if([[_grid[2] titleLabel].text isEqualToString:self.player]
              && [_grid[5] isEqualToString:self.player]
              && [[_grid[8] titleLabel].text isEqualToString:self.player]){
        
        self.whoWon = self.player;
    } else if([[_grid[2] titleLabel].text isEqualToString:self.player]
              && [_grid[4] isEqualToString:self.player]
              && [[_grid[6] titleLabel].text isEqualToString:self.player]){
        self.whoWon = self.player;
    }
    if (![self.whoWon isEqualToString:@""] || self.whoWon != nil) {
        [self proclaimVictory:self.whoWon];
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

-(void)proclaimVictory:(NSString *)winner {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"WINNER!"
                                                                   message:[NSString
                                                                            stringWithFormat:@"%@ has won!",winner]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self resetGame];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    

}

-(void)resetGame {
    //Reset game logic
}

@end
