//
//  JKSegementScrollPageView.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKSegementScrollPageView.h"

CGFloat const kSegmentViewHeight=30;

@interface JKSegementScrollPageView()

@end
@implementation JKSegementScrollPageView

@synthesize currentIndex=_currentIndex;

- (instancetype)init {
    self=[super init];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _segmentView.frame=CGRectMake(0, 0, self.frame.size.width, kSegmentViewHeight);
    _scrollPageView.frame=CGRectMake(0, kSegmentViewHeight, self.frame.size.width, self.frame.size.height-kSegmentViewHeight);
}

- (void)setupSubViews {
    _segmentView=[[JKSegmentView alloc] init];
    _scrollPageView=[[JKScrollPageView alloc] init];
    _scrollPageView.segmentView=_segmentView;
    
    [self addSubview:_scrollPageView];
    [self addSubview:_segmentView];
}

- (void)setPages:(NSMutableArray *)pages {
    self.scrollPageView.pages=pages;
}

- (void)setTitles:(NSMutableArray *)titles {
    self.segmentView.titles=titles;
}

- (void)setTilteNormalStyle:(JKTilteNormalStyle)tilteNormalStyle {
    self.segmentView.tilteNormalStyle=tilteNormalStyle;
}

- (void)setSeletedTitleColor:(UIColor *)seletedTitleColor {
    self.segmentView.selectedTitleColor=seletedTitleColor;
}

- (void)setShowIndicator:(BOOL )showIndicator {
    self.segmentView.showIndicator=showIndicator;
}

- (void)setPageChanged:(void (^)(NSUInteger))pageChanged{
    self.segmentView.segmentChanged=pageChanged;
}

- (void)setCurrentIndex:(NSUInteger)currentIndex {
    self.scrollPageView.currentPageIndex=currentIndex;
}

- (NSUInteger)currentIndex {
    return self.scrollPageView.currentPageIndex;
}

- (void)addViewToCurrentPage:(UIView *)view {
    [self.scrollPageView addViewToCurrentPage:view];
}



@end
