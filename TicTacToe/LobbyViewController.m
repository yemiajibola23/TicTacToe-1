//
//  LobbyViewController.m
//  TicTacToe
//
//  Created by Michael Berger on 1/16/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "LobbyViewController.h"

@interface LobbyViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation LobbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
