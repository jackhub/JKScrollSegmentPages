//
//  JKSegmentView.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "JKSegmentView.h"

#define kDefaultTitleColor [UIColor blackColor]
#define kDefaultSeletedTitleColor [UIColor redColor]

@interface JKSegmentView()
@property (nonatomic, strong) UIView *indictorView;
@end

@implementation JKSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self=[super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
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
        UIButton *button=[[UIButton alloc] init];
        button.tag=100+i;
        [button setTitle:title forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:13];
        [button setTitleColor:kDefaultTitleColor forState:UIControlStateNormal];
        [button setTitleColor:kDefaultSeletedTitleColor forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        [button sizeToFit];
        
        CGSize buttonSize=button.bounds.size;
        CGPoint buttonPoint=CGPointMake(totalWidth, 0);
        [button setFrame:CGRectMake(buttonPoint.x, buttonPoint.y, buttonSize.width, buttonSize.height)];
        
        [self addSubview:button];
        totalWidth=totalWidth+buttonSize.width;
    }
    
    self.contentSize=CGSizeMake(totalWidth, 0);
    
    //设置指示标签
    self.seletedIndex=0;
    UIButton *seletedButton=(UIButton *)[self viewWithTag:100];
    CGSize buttonSize=seletedButton.frame.size;
    CGPoint buttonOrigin=seletedButton.frame.origin;
    self.indictorView=[[UIView alloc] initWithFrame:CGRectMake(buttonOrigin.x, buttonSize.height-2, buttonSize.width, 2)];
    self.indictorView.backgroundColor=kDefaultSeletedTitleColor;
    [self addSubview:self.indictorView];

}


- (void)buttonClicked:(UIButton *)sender {
    NSLog(@"buttonClicked");
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
    
    
    UIButton *seletedButton=(UIButton *)[self viewWithTag:100+seletedIndex];
    CGRect indictorFrmae=self.indictorView.frame;
    indictorFrmae.origin=CGPointMake(seletedButton.frame.origin.x, indictorFrmae.origin.y);
    indictorFrmae.size=CGSizeMake(seletedButton.frame.size.width,indictorFrmae.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        self.indictorView.frame=indictorFrmae;
    }];
    
    if (indictorFrmae.origin.x>self.frame.size.width/2.0 && self.contentSize.width-indictorFrmae.origin.x>self.frame.size.width/2) {
        CGFloat scrollOffset=indictorFrmae.origin.x-(self.frame.size.width/2.0);
        [self setContentOffset:CGPointMake(scrollOffset, 0) animated:YES];

    } else if(self.contentSize.width-indictorFrmae.origin.x<=self.frame.size.width/2.0) {
            CGFloat scrollOffset=self.contentSize.width-self.frame.size.width;
            [self setContentOffset:CGPointMake(scrollOffset, 0) animated:YES];
        }else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    
    for (int i=100; i<self.titles.count+100;i++) {
        UIButton *button = (UIButton*)[self viewWithTag:i];
        if (_seletedIndex+100 == button.tag) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor=titleColor;
    for (int i=100; i<self.titles.count+100;i++) {
        UIButton *button = (UIButton*)[self viewWithTag:i];
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    _selectedTitleColor=selectedTitleColor;
    for (int i=100; i<self.titles.count+100;i++) {
        UIButton *button = (UIButton*)[self viewWithTag:i];
        [button setTitleColor:selectedTitleColor forState:UIControlStateSelected];
    }
    self.indictorView.backgroundColor=selectedTitleColor;
}

@end
