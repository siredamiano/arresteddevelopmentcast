//
//  DetailViewController.h
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

