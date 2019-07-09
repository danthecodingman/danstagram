//
//  MainViewController.m
//  danstagram
//
//  Created by danielavila on 7/9/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import "MainViewController.h"
#import "Parse/Parse.h"

@interface MainViewController ()

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
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
