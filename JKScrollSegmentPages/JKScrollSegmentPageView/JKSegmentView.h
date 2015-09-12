//
//  JKSegmentView.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKScrollPageView.h"
#import "JKTitleButton.h"

@class JKScrollPageView;

@interface JKSegmentView : UIScrollView

@property (nonatomic, strong)   NSMutableArray                 *titles;
@property (nonatomic, strong)   void(^segmentChanged)(NSUInteger);
@property (nonatomic, assign)   NSUInteger              seletedIndex;
@property (nonatomic, weak)     JKScrollPageView        *scrollPageView;
@property (nonatomic, assign)   JKTilteNormalStyle      tilteNormalStyle;
@property (nonatomic, strong)   UIColor                 *selectedTitleColor;
@property (nonatomic, assign, getter=isShowIndicator) BOOL showIndicator;

@end
