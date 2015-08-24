//
//  JKTitelButton.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/24/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,JKTilteNormalStyle) {
    JKTilteNormalStyleDark,
    JKTilteNormalStyleLight,
};

@interface JKTitleButton : UIButton
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic, assign) JKTilteNormalStyle tilteNormalStyle;
@end
