//
//  DraggableImageView.h
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TokenImageView.h"
#import "GameViewController.h"

@interface DraggableImageView : TokenImageView

-(void)setup:(NSArray *)grid gameVC:(GameViewController *)gameVC;

@end
