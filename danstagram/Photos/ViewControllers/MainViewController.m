//
//  MainViewController.m
//  danstagram
//
//  Created by danielavila on 7/9/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import "MainViewController.h"
#import "Parse/Parse.h"
#import "Post.h"
#import "GramCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray * posts;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

@end

@implementation MainViewController
- (IBAction)logout:(UIButton *)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
        // PFUser.current() will now be nil
    }];
    [self performSegueWithIdentifier:@"backHome" sender:self];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // construct PFQuery
    self.tableView.dataSource = self;// step 3
    self.tableView.delegate = self;
    
    self.tableView.rowHeight = 600;
    
    [self fetchPosts];// step 1
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(fetchPosts) forControlEvents:UIControlEventValueChanged];
     [self.tableView addSubview:self.refreshControl];
    
    
    //reload data

}

- (void)fetchPosts {
    PFQuery *postQuery = [Post query];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    // fetch data asynchronously
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.posts = [NSArray arrayWithArray:posts] ;// step 6
            [self.tableView reloadData];// step 4 5 7
        }
        else {
            // handle error
        }
        [self.refreshControl endRefreshing];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GramCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GramCell"];// step 2
    
    NSDictionary *post = self.posts[indexPath.row];
    
    
    cell.homeCaption.text = post[@"caption"];
    PFUser *user = post[@"author"];
    cell.homeUser.text = user.username;
    
    PFFileObject *pfobj = post[@"image"];
    NSURL *posterURL = [NSURL URLWithString: pfobj.url];
    cell.homeImage.image = nil;
    [cell.homeImage setImageWithURL:posterURL];
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    NSDictionary *post = self.posts[indexPath.row];
    
    DetailsViewController *detailViewController = [segue destinationViewController];
    detailViewController.post = post;
}

@end
