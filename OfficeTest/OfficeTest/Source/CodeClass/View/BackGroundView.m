//
//  BackGroundView.m
//  OfficeTest
//
//  Created by suruikeji on 16/6/30.
//  Copyright © 2016年 com.SuRuikeji.fany. All rights reserved.
//

#import "BackGroundView.h"

@implementation BackGroundView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_BACKGROUND;
    }
    return self;
}

@end
