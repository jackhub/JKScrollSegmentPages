//
//  JKScrollPageView.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKScrollPageView.h"

@interface JKScrollPageView()<UIScrollViewDelegate>
@end

@implementation JKScrollPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.pagingEnabled=YES;
        self.delegate=self;
    }
    return self;
}

//布局
- (void)layoutSubviews {
    
    CGFloat totalWidth=0;
    NSArray *pages=self.pages;
    NSInteger titleCounts=[self.segmentView.titles count];
    for (UIView *page in pages) {
        page.frame=CGRectMake(totalWidth, 0, self.frame.size.width, self.frame.size.height);
        totalWidth=totalWidth+self.frame.size.width;
    }
    self.contentSize=CGSizeMake((self.frame.size.width)*titleCounts, 0);
}

- (void)setPages:(NSMutableArray *)pages {
    _pages=pages;
    
    for (UIView *page in pages) {
        [self addSubview:page];
    }
}

- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex {
    _currentPageIndex=currentPageIndex;
    self.segmentView.seletedIndex=currentPageIndex;
}

- (void)setContentOffsetToIndex:(NSUInteger)index {
    self.contentOffset=CGPointMake(self.frame.size.width*index, 0);
    _currentPageIndex=index;
}

- (void)setSegmentView:(JKSegmentView *)segmentView {
    _segmentView=segmentView;
    segmentView.scrollPageView=self;
}

- (void)addViewToCurrentPage:(UIView *)view {
    view.frame=self.bounds;
    [self addSubview:view];
}


- (void)scrollViewDidEndDecelerating:(nonnull UIScrollView *)scrollView {
    NSUInteger currentIndex=self.contentOffset.x/self.frame.size.width;
    self.currentPageIndex=currentIndex;
}

- (void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView {
    if (scrollView.contentOffset.x>0) {
        CGFloat offsetValue=scrollView.contentOffset.x/self.frame.size.width;
        NSUInteger leftIndex=(NSUInteger)offsetValue;
        NSUInteger rightIndex=leftIndex+1;
        CGFloat rightOffset=offsetValue-leftIndex;
        CGFloat leftOffset=1-rightOffset;
        
        JKTitleButton *leftButton=(JKTitleButton *)[self.segmentView viewWithTag:100+leftIndex];
        leftButton.scale=leftOffset;
        
        JKTitleButton *rightButton=(JKTitleButton *)[self.segmentView viewWithTag:100+rightIndex];
        rightButton.scale=rightOffset;
    }
}

@end
