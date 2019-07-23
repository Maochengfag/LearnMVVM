//
//  TableViewController.m
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "TableViewController.h"
#import "YiRefreshFooter.h"
#import "YiRefreshHeader.h"
#import "TableViewModel.h"
#import "TableViewDelegate.h"
#import "TableViewDataSource.h"

@interface TableViewController()<TitleValueDelegate>
{
    YiRefreshHeader *refreshHeader;
    YiRefreshFooter *refreshFooter;
    NSMutableArray *totalSource;
    TableViewModel *tableViewModel;
    UITableView *tableView;
    TableViewDataSource *tableViewDataSource;
    TableViewDelegate *tableViewDelegate;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LearnMVVM";
    self.view.backgroundColor=[UIColor whiteColor];
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableViewDataSource = [[TableViewDataSource alloc] init];
    tableViewDelegate = [[TableViewDelegate alloc] init];
    tableViewDelegate.delegate = self;
    tableView.delegate = tableViewDelegate;
    tableView.dataSource = tableViewDataSource;
    tableViewModel = [[TableViewModel alloc] init];
    totalSource = 0;

    refreshHeader = [[YiRefreshHeader alloc] init];
    refreshHeader.scrollView = tableView;
    [refreshHeader header];
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf headerRefreshAction];
    };
    
    refreshFooter = [[YiRefreshFooter alloc] init];
    refreshFooter.scrollView = tableView;
    [refreshFooter footer];
    
    refreshFooter.beginRefreshingBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf footerRefreshAction];
    };
    
    
}

- (void)headerRefreshAction{
    [tableViewModel headerRefreshRequestWithCall:^(NSArray *array) {
        self->totalSource=(NSMutableArray *)array;
        self->tableViewDataSource.array=self->totalSource;
        self->tableViewDelegate.array=self->totalSource;
        [self->refreshHeader endRefreshing];
        [self->tableView reloadData];
    }];
}

- (void)footerRefreshAction{
    [tableViewModel footerRefreshRequestWithCall:^(NSArray *array) {
        [self->totalSource addObjectsFromArray:array] ;
        self->tableViewDataSource.array=self->totalSource;
        self->tableViewDelegate.array=self->totalSource;
        [self->refreshFooter endRefreshing];
        [self->tableView reloadData];
    }];
}

#pragma mark ---
- (void)getTitle:(NSString *)title{
    
    NSLog(@"getTitle===%@",title);
//    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:title delegate:nil cancelButtonTitle:@"sure" otherButtonTitles:nil, nil];
//    [alert show];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = title;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 220, 50)];
    label.text = title;
    label.textColor = [UIColor redColor];
    [label setTextAlignment:NSTextAlignmentCenter];
    [viewController.view addSubview:label];
    
    viewController.view.backgroundColor = [UIColor whiteColor];
    
    [self presentViewController:viewController animated:YES completion:^{
        sleep(2);
        [viewController dismissViewControllerAnimated:YES completion:nil];
    }];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
