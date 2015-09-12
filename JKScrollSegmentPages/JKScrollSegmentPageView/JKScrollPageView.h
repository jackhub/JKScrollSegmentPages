//
//  JKScrollPageView.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKSegmentView.h"

@class  JKSegmentView;

@interface JKScrollPageView : UIScrollView

@property (nonatomic, strong) NSMutableArray *pages;
@property (nonatomic, weak) JKSegmentView *segmentView;
@property (nonatomic, assign) NSUInteger currentPageIndex;

- (void)setContentOffsetToIndex:(NSUInteger)index;
- (void)addViewToCurrentPage:(UIView *)view;

@end
