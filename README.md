# JKScrollSegmentPages
A scrollable page from left to right with a scrollable title following it.

#usage

```Objective-C
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
  
    // 设置pages
    _segmentScrollPageView.pages=@[v1,v2,v3,v11,v21,v31,v12,v22,v32];
    // 设置标题
    _segmentScrollPageView.titles=@[@"News",@"Sports",@"iOS I Love It",@"News",@"Sports",@"iOS",@"News",@"Sports",@"iOS"];
    // 设置是否显示标题下的指示器
    _segmentScrollPageView.showIndicator=YES;
    // 设置选中高亮时标题颜色
    _segmentScrollPageView.seletedTitleColor=[UIColor purpleColor];
    // 设置标题背景色
    _segmentScrollPageView.segmentView.backgroundColor=[UIColor whiteColor];
    // 设置标题普通情况下的颜色风格，有黑色Dark和白色Light可选
    _segmentScrollPageView.normalTitleColor=JKTilteNormalStyleDark;
    // 设置当前page index值。
    _segmentScrollPageView.currentIndex=0;

}
```
