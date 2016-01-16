//
//  MenuViewController.m
//  TicTacToe
//
//  Created by Michael Berger on 1/16/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    if ([[segue identifier] isEqualToString:@"menuToGame"]) {
        GameViewController *gameVC = [segue destinationViewController];
        [gameVC gameMode:(int)[sender tag]];
    }
}


@end
