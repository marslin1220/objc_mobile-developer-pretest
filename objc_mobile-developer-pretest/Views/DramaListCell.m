//
//  DramaListCell.m
//  objc_mobile-developer-pretest
//
//  Created by Lin Cheng Lung on 2018/4/29.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

#import "DramaListCell.h"
#import <Masonry/Masonry.h>

@implementation DramaListCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [self.thumbnail mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.centerY.equalTo(self);

        make.width.equalTo(@(50)); // TODO: fix the ratio
    }];

    [self.dramaName mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.thumbnail.mas_right);
    }];

    [self.rating mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
    }];

    [self.createdDate mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.top.equalTo(self.rating.mas_bottom);
    }];

    [super updateConstraints];
}

#pragma mark - Accessor Method

- (UILabel *)dramaName {
    if (nil != _dramaName) {
        return _dramaName;
    }

    _dramaName = [UILabel new];
    [self addSubview:_dramaName];

    return _dramaName;
}

- (UILabel *)rating {
    if (nil != _rating) {
        return _rating;
    }

    _rating = [UILabel new];
    [self addSubview:_rating];

    return _rating;
}

- (UILabel *)createdDate {
    if (nil != _createdDate) {
        return _createdDate;
    }

    _createdDate = [UILabel new];
    [self addSubview:_createdDate];

    return _createdDate;
}

- (UIImageView *)thumbnail {
    if (nil != _thumbnail) {
        return _thumbnail;
    }

    _thumbnail = [UIImageView new];
    [self addSubview:_thumbnail];

    return _thumbnail;
}

@end
