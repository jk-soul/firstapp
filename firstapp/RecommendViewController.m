//
//  RecommendViewController.m
//  firstapp
//
//  Created by ipad on 2019/12/12.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

@end

@implementation RecommendViewController

-(instancetype)init{
    if(self = [super init]){
        
        self.view.backgroundColor = [UIColor blueColor];
        self.tabBarItem.title = @"推荐";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollview.backgroundColor = [UIColor lightGrayColor];
    scrollview.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height * 2);
    scrollview.pagingEnabled = YES;
    scrollview.delegate = self;
    [self.view addSubview:scrollview];
    
    NSArray * colors= @[[UIColor redColor],[UIColor blueColor], [UIColor yellowColor], [UIColor lightGrayColor],[UIColor grayColor]];
    for (int i = 0; i<5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        view.backgroundColor = [colors objectAtIndex:i];
        [scrollview addSubview:view];
    }

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scroll %@",@(scrollView.contentOffset.y));
};

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"begin");
};
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
     NSLog(@"end");
};

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"begin de");
};

// called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"end de");
};


@end
