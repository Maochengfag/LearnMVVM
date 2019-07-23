//
//  TableViewDelegate.m
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "TableViewDelegate.h"
#import "MyModel.h"

@implementation TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_array.count>0) {
        NSString *title = ((MyModel *)[_array objectAtIndex:indexPath.row]).title;
        if (_delegate&&[_delegate respondsToSelector:@selector(getTitle:)]) {
            [_delegate getTitle:title];
        }
    }
}

@end
