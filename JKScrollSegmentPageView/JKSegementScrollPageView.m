//
//  JKSegementScrollPageView.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKSegementScrollPageView.h"
#import "JKScrollPageView.h"

CGFloat const kSegmentViewHeight=30;

@interface JKSegementScrollPageView()

@property (nonatomic, strong) JKSegmentView *segmentView;
@property (nonatomic, strong) JKScrollPageView *scrollPageView;

@end
@implementation JKSegementScrollPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        _segmentView=[[JKSegmentView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, kSegmentViewHeight)];
        _scrollPageView=[[JKScrollPageView alloc] initWithFrame:CGRectMake(0, kSegmentViewHeight, self.frame.size.width, self.frame.size.height-kSegmentViewHeight)];
        
        _scrollPageView.segmentView=_segmentView;
        
        [self addSubview:_segmentView];
        [self addSubview:_scrollPageView];
    }
    return self;
}

- (void)setPages:(NSArray *)pages {
    self.scrollPageView.pages=pages;
}

- (void)setTitles:(NSArray *)titles {
    self.segmentView.titles=titles;
}

- (void)setSeletedTitleColor:(UIColor *)seletedTitleColor {
    self.segmentView.selectedTitleColor=seletedTitleColor;
}


@end
