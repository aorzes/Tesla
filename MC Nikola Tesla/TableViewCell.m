//
//  TableViewCell.m
//  MC Nikola Tesla
//
//  Created by Milorad Orzes on 22/02/16.
//  Copyright © 2016 Anton Orzes. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.slikaUCeliji.frame = CGRectMake(10,10,32,32);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
