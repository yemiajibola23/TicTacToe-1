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
@property CGRect startingFrame;

@end


@implementation DraggableImageView

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setOriginalPosition:CGPointMake([self center].x, [self center].y)];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
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
    [self drop];
}


-(void)drop {
    
    for (GridSpot *dropTarget in _gridSpots) {
        
        if (CGRectContainsPoint([dropTarget boundsInSuperView], [self center])) {
            [self setCenter:_originalPosition];
            if ([dropTarget dropToken:[self image]]) {
                //NSLog(@"Valid drop");
                [dropTarget setToken:[self tokenDrop]];
                [_gameVC movePlaced:dropTarget byPlayer:[dropTarget token]];
                
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


-(void)animateToGridSpot:(GridSpot *)view {
    NSLog(@"Center: (%f,%f)",[self center].x, [self center].y);
    [self setCenter:_originalPosition];
    NSLog(@"Center: (%f,%f)",[self center].x, [self center].y);
    CGRect newFrame = [view boundsInSuperView];
   // CGPoint newCenter = CGPointMake(newFrame.origin.x - (newFrame.size.width/2), newFrame.origin.y - (newFrame.size.height/2));
    NSLog(@"%f,%f",newFrame.origin.x,newFrame.origin.y);
    
    self.frame = newFrame;
    [self drop];
//    [UIView animateWithDuration:0.3 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        
//        self.frame = newFrame;
//        
//    } completion:^(BOOL finished) {
//        [self drop];
//        //[self movePlaced:[_gridSpots objectAtIndex:index] byPlayer:_playerToken == 'x' ? 'o' : 'x'];
//    }];
}




@end
