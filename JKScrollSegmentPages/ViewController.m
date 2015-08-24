//
//  ViewController.m
//  JKScrollSegmentPages
//
//  Created by jackhu on 8/23/15.
//  Copyright © 2015 jackhu. All rights reserved.
//

#import "ViewController.h"
#import "JKSegementScrollPageView.h"

@interface ViewController ()
@property (strong, nonatomic) JKSegementScrollPageView *segmentScrollPageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _segmentScrollPageView=[[JKSegementScrollPageView alloc] initWithFrame:CGRectOffset(self.view.frame, 0, 20)];
    [self.view addSubview:_segmentScrollPageView];
    
    UIView *v1=[[UIView alloc] init];
    v1.backgroundColor=[UIColor redColor];
    
    UIView *v2=[[UIView alloc] init];
    v2.backgroundColor=[UIColor yellowColor];
    
    UIView *v3=[[UIView alloc] init];
    v3.backgroundColor=[UIColor blueColor];
    
    UIView *v11=[[UIView alloc] init];
    v11.backgroundColor=[UIColor redColor];
    
    UIView *v21=[[UIView alloc] init];
    v21.backgroundColor=[UIColor yellowColor];
    
    UIView *v31=[[UIView alloc] init];
    v31.backgroundColor=[UIColor blueColor];
    
    UIView *v12=[[UIView alloc] init];
    v12.backgroundColor=[UIColor redColor];
    
    UIView *v22=[[UIView alloc] init];
    v22.backgroundColor=[UIColor yellowColor];
    
    UIView *v32=[[UIView alloc] init];
    v32.backgroundColor=[UIColor blueColor];
    
    _segmentScrollPageView.pages=@[v1,v2,v3,v11,v21,v31,v12,v22,v32];
    _segmentScrollPageView.titles=@[@"News",@"Sports",@"iOS I Love It",@"News",@"Sports",@"iOS",@"News",@"Sports",@"iOS"];
    _segmentScrollPageView.showIndicator=YES;
    _segmentScrollPageView.seletedTitleColor=[UIColor purpleColor];
    _segmentScrollPageView.segmentView.backgroundColor=[UIColor whiteColor];
    _segmentScrollPageView.normalTitleColor=JKTilteNormalStyleDark;
    _segmentScrollPageView.currentIndex=0;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    //用storyboard加载时，注意在要视图被加载显示后在添加子视图，这样的frame值才是对的。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
