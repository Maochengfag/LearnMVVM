//
//  TableViewDelegate.h
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TitleValueDelegate <NSObject>

- (void)getTitle:(NSString *)title;

@end

@interface TableViewDelegate : NSObject<UITableViewDelegate>
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, weak) id<TitleValueDelegate> delegate;

@end
