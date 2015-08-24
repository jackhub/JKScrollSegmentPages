//
//  JKSegementScrollPageView.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKScrollPageView.h"


@interface JKSegementScrollPageView : UIView

@property (nonatomic, strong) NSArray *pages;
@property (nonatomic, strong) NSArray *titles;

//set normal status title color: white or black.
@property (nonatomic, assign) JKTilteNormalStyle normalTitleColor;
//set title color when seleted.
@property (nonatomic, strong) UIColor *seletedTitleColor;
//whether show indicator blow seleted title.
@property (nonatomic, assign,getter=isShowIndicator) BOOL showIndicator;
//set and get current index.
@property (nonatomic, assign) NSUInteger currentIndex;
//block executes when page index changed.
@property (nonatomic, strong) void(^pageChanged)(NSUInteger);

@property (nonatomic, strong) JKSegmentView *segmentView;
@property (nonatomic, strong) JKScrollPageView *scrollPageView;

@end
