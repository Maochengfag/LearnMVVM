//
//  TableViewDataSource.h
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *array;

@end
