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


- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        _segmentView=[[JKSegmentView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kSegmentViewHeight)];
        _scrollPageView=[[JKScrollPageView alloc] initWithFrame:CGRectMake(0, kSegmentViewHeight, self.frame.size.width, self.frame.size.height-kSegmentViewHeight)];
        
        _scrollPageView.segmentView=_segmentView;
        
        [self addSubview:_scrollPageView];
        [self addSubview:_segmentView];

    }
    return self;
}

- (void)setPages:(NSArray *)pages {
    self.scrollPageView.pages=pages;
}

- (void)setTitles:(NSArray *)titles {
    self.segmentView.titles=titles;
}

- (void)setNormalTitleColor:(JKTilteNormalStyle)normalTitleColor {
    self.segmentView.tilteNormalStyle=normalTitleColor;
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


@end
