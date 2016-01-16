//
//  GameViewController.h
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridSpot.h"

@interface GameViewController : UIViewController
-(void)movePlaced:(GridSpot*)gridSpot byPlayer:(char)player;
-(void)gameMode:(int)mode;
@end
