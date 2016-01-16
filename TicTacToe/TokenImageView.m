//
//  TokenImageView.m
//  TicTacToe
//
//  Created by Michael Berger on 1/15/16.
//  Copyright © 2016 JJones. All rights reserved.
//

#import "TokenImageView.h"

@implementation TokenImageView

-(void)awakeFromNib {
    _x = [UIImage imageNamed:@"X"];
    _o = [UIImage imageNamed:@"O"];
    
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setImage:[[self image] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
}

- (BOOL)myImageisEqualTo:(UIImage *)image
{
    NSData *data1 = UIImagePNGRepresentation([self image]);
    NSData *data2 = UIImagePNGRepresentation(image);
    
    return [data1 isEqual:data2];
}

@end
