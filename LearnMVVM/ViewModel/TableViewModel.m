//
//  TableViewModel.m
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (NSString *)f:(NSArray *)array{
    
    NSMutableArray *mArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSString *str in array){
        [str uppercaseString];
        [mArray addObject:str];
    }
    
    NSMutableArray *indexArray = [[NSMutableArray array] initWithCapacity:0];
    int maxCount = 0;
    int index =0;
    for (int i =0; i<mArray.count; i++) {
        
        NSString *value = [mArray objectAtIndex:i];
        
        int count = 0;
        
        for (int j=i+1; j<mArray.count; i++) {
            
            NSString *subString = [mArray objectAtIndex:j];
            if ([value isEqualToString:subString]) {
                count ++;
            }
        }
        
        if (count > maxCount) {
            
            maxCount = count;
            index = i;
            
        }
        
        
    }
    
    
    
    return @"";
}

- (void)headerRefreshRequestWithCall:(callback)callback{
    //后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            //主线程刷新视图
            NSMutableArray *arr = [NSMutableArray array];
            for (int i =0; i<16; i++) {
                int x = arc4random() % 50;
                NSString *string = [NSString stringWithFormat:@"      random %d 头部刷新",x];
                MyModel *model = [[MyModel alloc] init];
                model.title = string;
                [arr addObject:model];
            }
            callback(arr);
        });
    });
}

- (void)footerRefreshRequestWithCall:(callback)callback{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSMutableArray *array = [NSMutableArray array];
            for (int i = 0; i < 16; i++) {
                int x = arc4random() % 100;
                NSString *string = [NSString stringWithFormat:@"     random %d 尾部刷新",x];
                MyModel *model = [[MyModel alloc] init];
                model.title = string;
                [array addObject:model];
            }
            callback(array);
        });
    });
}

@end
