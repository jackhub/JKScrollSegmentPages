//
//  JKTitelButton.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/24/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKTitleButton.h"

@implementation JKTitleButton

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.scale=1.0;
    }else {
        self.scale=0.0;
    }
}

- (void)setScale:(CGFloat)scale {
    if (!self.selectedColor) {
        self.selectedColor=[UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    }
    
    CGFloat red, green, blue, alpha;
    [self.selectedColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    if (self.tilteNormalStyle==JKTilteNormalStyleDark) {
        [self setTitleColor:[UIColor colorWithRed:scale*red green:green*scale blue:blue*scale alpha:1.0] forState:UIControlStateNormal];
    } else {
        [self setTitleColor:[UIColor colorWithRed:red+(1-red)*(1-scale) green:green+(1-green)*(1-scale) blue:blue+(1-blue)*(1-scale) alpha:1.0] forState:UIControlStateNormal];
    }
    
    CGFloat scaleFactor=0.8+scale*0.2;
    self.transform=CGAffineTransformScale(CGAffineTransformIdentity, scaleFactor, scaleFactor);
}

@end
