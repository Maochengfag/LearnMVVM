//
//  TableViewDataSource.m
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "TableViewDataSource.h"
#import "MyTableViewCell.h"
#import "MyModel.h"

@implementation TableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.titleLab.text = ((MyModel *)[_array objectAtIndex:indexPath.row]).title;
    return cell;
}
@end
