//
//  GridSpot.h
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TokenImageView.h"

@interface GridSpot : TokenImageView

@property int gridSpotID;
@property CGRect boundsInSuperView;
@property char token;
-(BOOL)dropToken:(UIImage *)token;
-(void)dropAnimation;
-(void)resetImage;
-(void)highlightWithColor:(UIColor *)color;
@end
