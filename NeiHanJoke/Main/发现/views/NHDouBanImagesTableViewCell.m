//
//  NHDouBanImagesTableViewCell.m
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import "NHDouBanImagesTableViewCell.h"

#import "NHDouBanMovieShowModel.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation NHDouBanImagesTableViewCell


- (void)nh_updateDataWithModel:(NHEntriesModel *)model{
    [self.movieImageView sd_setImageWithURL:[NSURL URLWithString:model.images.small] placeholderImage:nil];
    self.movieTitleLabel.text = model.movieTitle;
    self.timeLabel.text = model.pubdate;
    self.collectionLabel.text = model.collection;
    self.zanLabel.text = model.stars;
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
