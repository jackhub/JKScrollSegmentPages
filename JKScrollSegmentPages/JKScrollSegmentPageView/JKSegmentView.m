//
//  JKSegmentView.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKSegmentView.h"

#define kDefaultSeletedTitleColor [UIColor redColor]
NSUInteger const kTitleFontSize=14; //标签字体大小
NSUInteger const kTitleInsect=10;   //标签左右额外空隙

@interface JKSegmentView()
@property (nonatomic, strong) UIView *indictorView;
@end

@implementation JKSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        self.showIndicator=YES;
    }
    return self;
}

- (void)setTitles:(NSArray *)titles {
    for (UIView *v1 in self.subviews) {
        [v1 removeFromSuperview];
    }
    _titles=titles;
    CGFloat totalWidth=0;
    
    for (int i=0;i<[_titles count];i++) {
        NSString *title=(NSString *)_titles[i];
        JKTitleButton *button=[[JKTitleButton alloc] init];
        button.tag=100+i;
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:kTitleFontSize];
        button.tilteNormalStyle=self.tilteNormalStyle;

        if (self.tilteNormalStyle==JKTilteNormalStyleDark) {
            [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        } else {
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        [button sizeToFit];
        
        CGSize buttonSize=button.bounds.size;
        //设置标签左右空隙。
        buttonSize.width=button.bounds.size.width+kTitleInsect*2;
        
        CGPoint buttonPoint=CGPointMake(totalWidth, 0);
        [button setFrame:CGRectMake(buttonPoint.x, buttonPoint.y, buttonSize.width, buttonSize.height)];
        
        [self addSubview:button];
        totalWidth=totalWidth+buttonSize.width;
    }
    
    self.contentSize=CGSizeMake(totalWidth, 0);
    
    //设置指示标记
    self.seletedIndex=0;
    JKTitleButton *seletedButton=(JKTitleButton *)[self viewWithTag:100];
    CGSize buttonSize=seletedButton.frame.size;
    CGPoint buttonOrigin=seletedButton.frame.origin;
    self.indictorView=[[UIView alloc] initWithFrame:CGRectMake(buttonOrigin.x, buttonSize.height-1, buttonSize.width, 1)];
    self.indictorView.backgroundColor=kDefaultSeletedTitleColor;
    [self addSubview:self.indictorView];

}


- (void)buttonClicked:(JKTitleButton *)sender {
    NSUInteger index=sender.tag-100;
    if (self.seletedIndex==index) {
        return;
    }
    self.seletedIndex=index;
}


- (void)setSeletedIndex:(NSUInteger)seletedIndex {
    _seletedIndex=seletedIndex;
    
    [self.scrollPageView setContentOffsetToIndex:seletedIndex];
    
    if (self.segmentChanged) {
        self.segmentChanged(seletedIndex);
    }
    
    
    JKTitleButton *seletedButton=(JKTitleButton *)[self viewWithTag:100+seletedIndex];
    CGRect indictorFrmae=self.indictorView.frame;
    indictorFrmae.origin=CGPointMake(seletedButton.frame.origin.x, indictorFrmae.origin.y);
    indictorFrmae.size=CGSizeMake(seletedButton.frame.size.width,indictorFrmae.size.height);
    [UIView animateWithDuration:0.25 animations:^{
        self.indictorView.frame=indictorFrmae;
    }];
    
    //让标签滚动到中心。
    if (indictorFrmae.origin.x>self.frame.size.width/2.0-indictorFrmae.size.width/2.0 && self.contentSize.width-indictorFrmae.origin.x>self.frame.size.width/2+indictorFrmae.size.width/2.0) {
        CGFloat scrollOffset=indictorFrmae.origin.x-(self.frame.size.width/2.0-indictorFrmae.size.width/2.0);
        [self setContentOffset:CGPointMake(scrollOffset, 0) animated:YES];

    } else if(self.contentSize.width-indictorFrmae.origin.x<=self.frame.size.width/2.0+indictorFrmae.size.width/2.0) {
            CGFloat scrollOffset=self.contentSize.width-self.frame.size.width;
            [self setContentOffset:CGPointMake(scrollOffset, 0) animated:YES];
        }else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    
    for (int i=100; i<self.titles.count+100;i++) {
        JKTitleButton *button = (JKTitleButton*)[self viewWithTag:i];
        if (_seletedIndex+100 == button.tag) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

- (void)setTilteNormalStyle:(JKTilteNormalStyle)tilteNormalStyle {
    _tilteNormalStyle=tilteNormalStyle;
    for (int i=100; i<self.titles.count+100;i++) {
        JKTitleButton *button = (JKTitleButton*)[self viewWithTag:i];
        button.tilteNormalStyle=tilteNormalStyle;
    }
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    _selectedTitleColor=selectedTitleColor;
    for (int i=100; i<self.titles.count+100;i++) {
        JKTitleButton *button = (JKTitleButton*)[self viewWithTag:i];
        button.selectedColor=selectedTitleColor;
    }
    self.indictorView.backgroundColor=selectedTitleColor;
}

- (void)setShowIndicator:(BOOL )showIndicator {
    _showIndicator=showIndicator;
    if (self.isShowIndicator) {
        self.indictorView.alpha=1.0;
    } else {
        self.indictorView.alpha=0.0;
    }
}

@end
