//
//  UserContentTableViewCell.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/29.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "UserContentTableViewCell.h"

@implementation UserContentTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
