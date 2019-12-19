//
//  NewsDeleteView.h
//  firstapp
//
//  Created by ipad on 2019/12/17.
//  Copyright © 2019 ipad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDeleteView : UIView

-(void)showWithPosition:(CGPoint)point clickBlock:(dispatch_block_t) deleteBlock;

-(void)hide;

@end

NS_ASSUME_NONNULL_END
