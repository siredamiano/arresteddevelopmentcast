//
//  CastItem.h
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CastItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, weak) UIImage *castImage;

@end
