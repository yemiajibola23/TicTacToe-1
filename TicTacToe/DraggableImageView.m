//
//  DraggableImageView.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "DraggableImageView.h"
#import "GridSpot.h"

@interface DraggableImageView()

@property CGPoint originalPosition;
@property NSArray *gridSpots;



@end


@implementation DraggableImageView

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setOriginalPosition:CGPointMake([self center].x, [self center].y)];
}

-(void)setup:(NSArray *)grid {
    [self setGridSpots:grid];
}

#pragma -mark Touch

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setCenter:CGPointMake([[touches anyObject] locationInView:[self superview]].x, [[touches anyObject] locationInView:[self superview]].y)];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setCenter:CGPointMake([[touches anyObject] locationInView:[self superview]].x, [[touches anyObject] locationInView:[self superview]].y)];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint dropLocation = [[touches anyObject]locationInView:nil];
    
    for (GridSpot *dropTarget in _gridSpots) {
        
        if (CGRectContainsPoint([dropTarget boundsInSuperView], dropLocation)) {

            if ([dropTarget dropToken:[self image]]) {
                NSLog(@"Valid drop");
                [self switchImage];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"Move Placed" object:nil];
            } else {
                NSLog(@"Rejected drop");
            }
        }
    }
    
    
    [self setCenter:_originalPosition];
}

//-----------------------------

-(void)switchImage {
    if ([self myImageisEqualTo:super.x]) {
        [self setImage:super.o];
    } else {
        [self setImage:super.x];
    }
}


@end
