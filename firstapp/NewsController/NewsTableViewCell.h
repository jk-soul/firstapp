//
//  NewsTableViewCell.h
//  firstapp
//
//  Created by ipad on 2019/12/13.
//  Copyright © 2019 ipad. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewsTableViewCellDelegate <NSObject>

-(void)tableVIewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic,weak) id<NewsTableViewCellDelegate> delegate;

-(void)layoutTableViewCell;

@end

NS_ASSUME_NONNULL_END
