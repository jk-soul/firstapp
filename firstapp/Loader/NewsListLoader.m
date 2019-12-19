//
//  NewsListLoader.m
//  firstapp
//
//  Created by ipad on 2019/12/19.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "NewsListLoader.h"

@implementation NewsListLoader

-(void)loadListData{
    
    NSString *url = @"http://www.baidu.com";
    NSURL *listUrl = [NSURL URLWithString:url];
    
    NSURLRequest *listRequest = [NSURLRequest requestWithURL:listUrl];
    
};


@end
