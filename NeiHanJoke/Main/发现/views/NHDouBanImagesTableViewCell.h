//
//  NHDouBanImagesTableViewCell.h
//  NeiHanJoke
//
//  Created by Jason_Xu on 2017/5/19.
//  Copyright © 2017年 Jason_Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NHDouBanMovieShowModel;
@class NHEntriesModel;

@interface NHDouBanImagesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *collectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *zanLabel;


- (void)nh_updateDataWithModel:(NHEntriesModel *)model;


@end
