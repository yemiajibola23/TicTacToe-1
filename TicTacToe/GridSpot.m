//
//  GridSpot.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "GridSpot.h"

@interface GridSpot()


@end

@implementation GridSpot

-(void)awakeFromNib {
   [super awakeFromNib];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setBoundsInSuperView:[self convertRect: [self bounds] toView:[[[self superview]
                                                                               superview]
                                                                               superview] ]];
}

-(BOOL)dropToken:(UIImage *)token {
    
    if (![self myImageisEqualTo:super.x] && ![self myImageisEqualTo:super.o]) {
        [self setImage:token];
        return YES;
    }
    return NO;
}

@end
