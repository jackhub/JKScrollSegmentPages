//
//  JKSegmentView.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKScrollPageView.h"

@class JKScrollPageView;

@interface JKSegmentView : UIScrollView
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) void(^segmentChanged)(NSUInteger);
@property (nonatomic, assign) NSUInteger seletedIndex;
@property (nonatomic, weak) JKScrollPageView *scrollPageView;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *selectedTitleColor;
@end
