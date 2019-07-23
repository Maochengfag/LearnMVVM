//
//  TableViewModel.h
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^callback) (NSArray *array);

@interface TableViewModel : NSObject
//tableView头部刷新的网络请求
- (void)headerRefreshRequestWithCall:(callback) callback;

//tableView底部刷新的网络请求
- (void)footerRefreshRequestWithCall:(callback) callBack;
@end
