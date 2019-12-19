//
//  NewsTableViewCell.m
//  firstapp
//
//  Created by ipad on 2019/12/13.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "NewsTableViewCell.h"
@interface NewsTableViewCell()

@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *sourceLabel;
@property(nonatomic, strong, readwrite) UILabel *descLabel;
@property(nonatomic, strong, readwrite) UILabel *timeLabel;
@property(nonatomic, strong, readwrite) UIImageView *rightImageView;
@property(nonatomic, strong, readwrite) UIButton *button;

@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
    
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.descLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.descLabel.font = [UIFont systemFontOfSize:12];
            self.descLabel.textColor = [UIColor grayColor];
            self.descLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
        [self.contentView addSubview:({
            self.button = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
            self.button.backgroundColor = [UIColor redColor];
            [self.button setTitle:@"x" forState:UIControlStateNormal];
            [self.button setTitle:@"v" forState:UIControlStateHighlighted];
            [self.button addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
            self.button.layer.cornerRadius = 10;
            self.button.layer.masksToBounds = YES;
            self.button.layer.borderColor = [UIColor grayColor].CGColor;
            self.button.layer.borderWidth = 2;
            self.button;
        })];
        
    }
    return self;
};

-(void)layoutTableViewCell{
    self.titleLabel.text = @"标题123456";
    
    self.sourceLabel.text = @"来源";
    [self.sourceLabel sizeToFit];
    
    self.descLabel.text = @"描述";
    [self.descLabel sizeToFit];
    self.descLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.sourceLabel.frame.origin.y, self.descLabel.frame.size.width, self.descLabel.frame.size.height);
    
    self.timeLabel.text = @"时间";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.descLabel.frame.origin.x + self.descLabel.frame.size.width + 15, self.descLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"panda.jpeg"];
}

-(void)deleteButtonClick{
    if(self.delegate && [self.delegate respondsToSelector:@selector(tableVIewCell:clickDeleteButton:)]){
        [self.delegate tableVIewCell:self clickDeleteButton:self.button];
    }
}

@end
