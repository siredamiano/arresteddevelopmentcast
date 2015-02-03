//
//  MasterViewController.m
//  ArrestedDevelopment
//
//  Created by Damian A Torres on 1/31/15.
//  Copyright (c) 2015 tsu. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"


@interface MasterViewController ()

@property NSMutableArray *cast;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cast = [[NSMutableArray alloc] init];
    
    //Load the nib file
    UINib *nib = [UINib nibWithNibName:@"CastItemCell" bundle:nil];
    
    //Register this NIB, which contains the cell
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CastItemCell"];
    
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    
    [self fetchItems];
    
   }

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CastItem *object = self.cast[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cast.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CastItemCell *cell = (CastItemCell *)[tableView dequeueReusableCellWithIdentifier:@"CastItemCell" forIndexPath:indexPath];
    
    CastItem *castItem = self.cast[indexPath.row];
    cell.castMemberTitle.text = castItem.title;
    cell.date.text = [Utils actualDate];
    
    
    NSURL *url = [NSURL URLWithString:castItem.imageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    
    __weak CastItemCell *weakCell = cell;
    __weak CastItem *weakCastItem = castItem;
    
    [cell.imageView setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakCastItem.castImage = image;
                                       weakCell.castMemberImage.image = [Utils setThumbnailFromImage:image];
                                       weakCell.castMemberImage.layer.cornerRadius = weakCell.castMemberImage.frame.size.width / 2;
                                       weakCell.castMemberImage.clipsToBounds = YES;
                                       [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"showDetail" sender:nil];
}

- (void) fetchItems {

    PFQuery *query = [PFQuery queryWithClassName:@"Cast"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if(!error) {
        
            //Got the objects from Parse for that class name
            NSLog(@"Successfully retrieved %lu items.", (unsigned long)objects.count);
            
            for (PFObject *castObject in objects){
                CastItem *castMember = [[CastItem alloc] init];
                castMember.title = castObject[@"title"];
                castMember.imageURL = castObject[@"image"];
                castMember.desc = castObject[@"description"];
                NSLog(@"Found cast member: %@",castObject[@"title"]);
                [self.cast addObject:castMember];
                NSLog(@"Adding cast member to array...");
                
            }
            
            [self.tableView reloadData];
            
        } else {
            //Log details of why it failed
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        
    } ];

}




@end
