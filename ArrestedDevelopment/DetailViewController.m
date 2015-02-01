//
//  DetailViewController.m
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import "DetailViewController.h"
#import "CastItem.h"

@interface DetailViewController ()

@property (nonatomic, strong) CastItem *castItem;
@property (weak, nonatomic) IBOutlet UIImageView *castImage;
@property (weak, nonatomic) IBOutlet UILabel *castName;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;


@end

@implementation DetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.castItem = (CastItem *) self.detailItem;
    
    self.navigationItem.title = self.castItem.title;
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.castImage.image = self.castItem.castImage;
    self.castName.text = self.castItem.title;
    self.descriptionTextView.text = self.castItem.desc;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
