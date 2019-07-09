//
//  ViewController.m
//  danstagram
//
//  Created by danielavila on 7/8/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import "ViewController.h"
#import "Parse/Parse.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController
- (IBAction)loginNow:(UIButton *)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Information"
                                                                           message:[NSString stringWithFormat:@"%@", error.localizedDescription]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:^{}];
        } else {
            NSLog(@"User logged in successfully");
            
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
            
            
            // display view controller that needs to shown after successful login
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
