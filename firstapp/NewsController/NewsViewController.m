//
//  NewsViewController.m
//  firstapp
//
//  Created by ipad on 2019/12/5.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "NewsWebViewViewController.h"
#import "NewsDeleteView.h"
#import "NewsListLoader.h"

@interface NewsViewController ()<UITableViewDataSource, UITableViewDelegate, NewsTableViewCellDelegate>

@property (nonatomic, strong, readwrite) UITableView *tableView;

@property (nonatomic, strong, readwrite) NSMutableArray *dataArray;

@property (nonatomic, strong, readwrite) NewsListLoader *listLoader;

@end

@implementation NewsViewController

- (instancetype)init {
    if (self = [super init]) {
        self.dataArray = @[].mutableCopy;
        for (int i = 0; i < 20; i++) {
            [self.dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tabview = [[UITableView alloc] initWithFrame:self.view.bounds];
    tabview.dataSource = self;
    tabview.delegate = self;
    [self.view addSubview:tabview];
    self.tableView = tabview;
    [self.tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"NewsTableViewCell"];
    
    self.listLoader = [[NewsListLoader alloc] init];
    [self.listLoader loadListData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsWebViewViewController *vc = [NewsWebViewViewController new];
    vc.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell" forIndexPath:indexPath];

    cell.delegate = self;
    [cell layoutTableViewCell];
//    cell.textLabel.text = [NSString stringWithFormat: @"主标题 - %@",@(indexPath.row)];
//    cell.detailTextLabel.text = @"副标题";

    return cell;
}

- (void)setSubView {
    UIView *testView = [[UIView alloc] init];
    testView.backgroundColor = [UIColor greenColor];
    testView.frame = CGRectMake(150, 150, 100, 100);

    [self.view addSubview:testView];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [testView addGestureRecognizer:tap];
}

- (void)pushController {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.navigationItem.title = @"详情";
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧按钮" style:UIBarButtonItemStylePlain target:self action:nil];

    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableVIewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
    NSLog(@"123");
    NewsDeleteView *deleteView = [[NewsDeleteView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];

    __weak typeof (self) wsekf = self;
    [deleteView showWithPosition:rect.origin clickBlock:^{
        NSLog(@"call back");
        __strong typeof(self) strongSelf = wsekf;
        [strongSelf.dataArray removeLastObject];
        [strongSelf.tableView deleteRowsAtIndexPaths:@[[self.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
