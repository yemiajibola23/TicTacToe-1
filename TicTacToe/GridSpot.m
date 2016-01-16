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
        [self dropAnimation];
        return YES;
    }
    return NO;
}

-(void)resetImage {
    [self dropAnimation];
    [self setTintColor:[UIColor blackColor]];
    [self setImage:[UIImage imageNamed:@"Placeholder"]];
}

-(void)highlightWithColor:(UIColor *)color {
    [self setTintColor:color];
}

-(void)dropAnimation{
    
    int dist = 10;
    
    CGRect dropPos = [self frame];
    CGRect defaultPos = [self frame];
    
    dropPos.size = CGSizeMake(dropPos.size.width - dist, dropPos.size.height - dist);
    dropPos.origin = CGPointMake(dropPos.origin.x + (dist/2), dropPos.origin.y + (dist/2));
    
    [UIView animateWithDuration:0.1 animations:^{
        
        [self setFrame:dropPos];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.1 animations:^{
            [self setFrame:defaultPos];
            
        } completion:^(BOOL finished) {
            
            
        }];
      
        
    }];
    
}

@end
