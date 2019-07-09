//
//  LoginViewController.m
//  danstagram
//
//  Created by danielavila on 7/9/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController
- (IBAction)loginBack:(UIButton *)sender {
    
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.login.text;
    newUser.email = self.email.text;
    newUser.password = self.password.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Invalid Information"
                                                                           message:[NSString stringWithFormat:@"%@", error.localizedDescription]
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:^{}];

        } else {
            NSLog(@"User registered successfully");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];
    
}

-(void)loginFailed{
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
