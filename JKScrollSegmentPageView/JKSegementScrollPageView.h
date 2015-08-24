//
//  JKSegementScrollPageView.h
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKSegementScrollPageView : UIView
@property (nonatomic, strong) NSArray *pages;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *seletedTitleColor;

@end
