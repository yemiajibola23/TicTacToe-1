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
    
    [self resetGame];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
    [sender setTitle:[NSString stringWithFormat:@"%@",self.player] forState:UIControlStateNormal];
    [sender setHighlighted:NO];
    
    
    NSLog(@"%@",[_grid[0] currentTitle]);
    
    
    
    if ([[_grid[0] currentTitle] isEqualToString:self.player]
        && [[_grid[1] currentTitle] isEqualToString:self.player]
        && [[_grid[2] currentTitle] isEqualToString:self.player]){
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
        
    } else if([[_grid[3] currentTitle] isEqualToString:self.player]
              && [[_grid[4] currentTitle] isEqualToString:self.player]
              && [[_grid[5] currentTitle] isEqualToString:self.player]){
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
        
    } else if([[_grid[6] currentTitle] isEqualToString:self.player]
              && [[_grid[7] currentTitle] isEqualToString:self.player]
              && [[_grid[8] currentTitle] isEqualToString:self.player]){
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
        
    } else if([[_grid[0] currentTitle] isEqualToString:self.player]
              && [[_grid[4] currentTitle] isEqualToString:self.player]
              && [[_grid[8] currentTitle] isEqualToString:self.player]){
        
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
    } else if([[_grid[0] currentTitle] isEqualToString:self.player]
              && [[_grid[3] currentTitle] isEqualToString:self.player]
              && [[_grid[6] currentTitle] isEqualToString:self.player]){
        
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
    } else if([[_grid[1] currentTitle] isEqualToString:self.player]
              && [[_grid[4] currentTitle] isEqualToString:self.player]
              && [[_grid[7] currentTitle] isEqualToString:self.player]){
        
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
    } else if([[_grid[2] currentTitle] isEqualToString:self.player]
              && [[_grid[5] currentTitle] isEqualToString:self.player]
              && [[_grid[8] currentTitle] isEqualToString:self.player]){
        
        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
    } else if([[_grid[2] currentTitle] isEqualToString:self.player]
              && [[_grid[4] currentTitle] isEqualToString:self.player]
              && [[_grid[6] currentTitle] isEqualToString:self.player]){

        self.whoWon = self.player;
        [self proclaimVictory:self.whoWon];
    }
//    if (![self.whoWon isEqualToString:@""] || self.whoWon != ) {
//        [self proclaimVictory:self.whoWon];
//    }


    [sender setEnabled:false];
    
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
    for (UIButton *button in self.grid) {
        [button setTitle:@"[ ]" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setEnabled:YES];
    }
}



@end
