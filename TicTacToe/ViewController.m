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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = self.whichPlayerLabel.text;
    self.grid = @[self.buttonOne,self.buttonTwo,self.buttonThree,
                        self.buttonFour, self.buttonFive, self.buttonSix,
                        self.buttonSeven, self.buttonEight, self.buttonNine];
}

- (IBAction)onButtonTapped:(UIButton *)sender {
    [sender setTitle:self.player forState:UIControlStateNormal];
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

@end
