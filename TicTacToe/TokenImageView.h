//
//  TokenImageView.h
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TokenImageView : UIImageView

@property UIImage *x;
@property UIImage *o;

- (BOOL)myImageisEqualTo:(UIImage *)image;

@end
