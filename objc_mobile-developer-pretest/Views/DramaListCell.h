//
//  DramaListCell.h
//  objc_mobile-developer-pretest
//
//  Created by Lin Cheng Lung on 2018/4/29.
//  Copyright © 2018 Lin Cheng Lung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DramaListCell : UITableViewCell

@property (strong, nonatomic) UILabel *dramaName;
@property (strong, nonatomic) UILabel *rating;
@property (strong, nonatomic) UILabel *createdDate;
@property (strong, nonatomic) UIImageView *thumbnail;

@end
