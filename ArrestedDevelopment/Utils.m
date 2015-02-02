//
//  Utils.m
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *) actualDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/YYYY"];
    NSDate *now = [[NSDate alloc] init];
    
    NSString *date = [dateFormatter stringFromDate:now];
    return date;
}

+ (UIImage *)setThumbnailFromImage:(UIImage *)image {
    CGSize originalImageSize = image.size;
    
    //The rectangle of the thumbnail
    CGRect newRect = CGRectMake(0, 0, 78, 78);
    
    //Figure out a scaling ratio to make sure we maintain the same aspect ratio
    float ratio = MAX( newRect.size.width / originalImageSize.width, newRect.size.height/originalImageSize.height);
    
    //Create a transparent bitmap context with a scaling ratio factor
    //equal to that of the screen
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    //Create a path that is a rounded rectangle
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    //Make all subsequent drawing clip to this rounded rectangle
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width)/2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height)/2.0;
    
    //Draw the image on it
    [image drawInRect:projectRect];
    
    //Get the image from the image context; keep it as our thumbnail.
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Cleanup image context resources
    UIGraphicsEndImageContext();
    
    return smallImage;
    
}



@end
