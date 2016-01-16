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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    GameViewController *gameVC = [segue destinationViewController];
    [gameVC gameMode:(int)[sender tag]];
}


@end
