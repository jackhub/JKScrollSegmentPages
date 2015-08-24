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

- (void)awakeFromNib {
    NSLog(@"%@",NSStringFromSelector(_cmd));
    [super awakeFromNib];
    self.pagingEnabled=YES;
    self.delegate=self;
}


- (void)setPages:(NSArray *)pages {
    _pages=pages;
    
    CGFloat totalWidth=0;
    
    for (UIView *page in pages) {
        page.frame=CGRectMake(totalWidth, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:page];
        totalWidth=totalWidth+self.frame.size.width;
    }
    self.contentSize=CGSizeMake(totalWidth, 0);
}

- (void)setCurrentPageIndex:(NSUInteger)currentPageIndex {
    self.segmentView.seletedIndex=currentPageIndex;
}

- (void)setContentOffsetToIndex:(NSUInteger)index {
    self.contentOffset=CGPointMake(self.frame.size.width*index, 0);
}

- (void)setSegmentView:(JKSegmentView *)segmentView {
    _segmentView=segmentView;
    segmentView.scrollPageView=self;
}

- (void)scrollViewDidEndDecelerating:(nonnull UIScrollView *)scrollView {
    NSUInteger currentIndex=self.contentOffset.x/self.frame.size.width;
    self.segmentView.seletedIndex=currentIndex;
}

@end
