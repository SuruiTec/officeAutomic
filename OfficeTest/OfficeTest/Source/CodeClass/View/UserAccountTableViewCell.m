//
//  UserAccountTableViewCell.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/30.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "UserAccountTableViewCell.h"

@implementation UserAccountTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _header = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
        _header.image = [UIImage imageNamed:@"default_portrait"];
        _header.backgroundColor = COLOR_BACKGROUND;
        [self addSubview:_header];
        
        _nickName = [[UILabel alloc]initWithFrame:CGRectMake(100, _header.frame.origin.y, 200, 30)];
        _nickName.text = @"我的昵称";
        [self addSubview:_nickName];
        
        _account = [[UILabel alloc]initWithFrame:CGRectMake(_nickName.frame.origin.x, _nickName.frame.origin.y+_nickName.frame.size.height, _nickName.frame.size.width, _nickName.frame.size.height)];
        _account.text = @"帐号：13413512345";
        [self addSubview:_account];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
