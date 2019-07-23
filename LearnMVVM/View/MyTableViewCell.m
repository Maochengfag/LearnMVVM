//
//  MyTableViewCell.m
//  LearnMVVM
//
//  Created by Mac on 2019/6/26.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WScreen, 50)];
        [self.contentView addSubview:_titleLab];
        _titleLab.backgroundColor = [UIColor whiteColor];
        _titleLab.font = [UIFont systemFontOfSize:14];
    }
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
