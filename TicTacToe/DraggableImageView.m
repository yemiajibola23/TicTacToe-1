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
@property GameViewController* gameVC;


@end


@implementation DraggableImageView

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setOriginalPosition:CGPointMake([self center].x, [self center].y)];
}

-(void)setup:(NSArray *)grid gameVC:(GameViewController *)gameVC {
    [self setGridSpots:grid];
    [self setGameVC:gameVC];
    [self setImage:super.x];
    [self setHidden:NO];
}


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
                //NSLog(@"Valid drop");
                [dropTarget setToken:[self tokenDrop]];
                [_gameVC movePlaced:dropTarget];
            } else {
                //NSLog(@"Rejected drop");
            }
        }
    }
    
    
    [self setCenter:_originalPosition];
}


-(char)tokenDrop {
    if ([self myImageisEqualTo:super.x]) {
        [self setImage:super.o];
        return 'x';
    } else {
        [self setImage:super.x];
        return 'o';
    }
}


@end
