//
//  NewsDeleteView.m
//  firstapp
//
//  Created by ipad on 2019/12/17.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "NewsDeleteView.h"

@interface NewsDeleteView()

@property (nonatomic,strong,readwrite) UIView *backgroundView;
@property (nonatomic,strong,readwrite) UIButton *deleteButton;
@property (nonatomic,strong,readwrite) dispatch_block_t deleteBlock;

@end

@implementation NewsDeleteView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.backgroundView.backgroundColor = [UIColor blackColor];
        self.backgroundView.alpha = 0.3;
        [self.backgroundView addGestureRecognizer:({
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
            tap;
        })];
        [self addSubview:self.backgroundView];
        
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
        self.deleteButton.backgroundColor = [UIColor redColor];
        [self addSubview:self.deleteButton];
    }
    return self;
};

-(void)showWithPosition:(CGPoint)point clickBlock:(dispatch_block_t) deleteBlock{
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [deleteBlock copy];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

-(void)hide{
    [self removeFromSuperview];
}

-(void)deleteButtonClick{
    if(self.deleteBlock){
        self.deleteBlock();
    }
    [self removeFromSuperview];
};
@end
