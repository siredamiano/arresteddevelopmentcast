//
//  CastItemCellTableViewCell.h
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CastItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *castMemberImage;
@property (weak, nonatomic) IBOutlet UILabel *castMemberTitle;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
