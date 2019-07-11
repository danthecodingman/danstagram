//
//  DetailsViewController.m
//  danstagram
//
//  Created by danielavila on 7/10/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Parse/Parse.h"
#import "DateTools.h"


@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageDetail;
@property (weak, nonatomic) IBOutlet UILabel *usernameDetail;
@property (weak, nonatomic) IBOutlet UILabel *captionDetail;
@property (weak, nonatomic) IBOutlet UILabel *timeDetail;



@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.captionDetail.text = _post[@"caption"];
    PFUser *user = _post[@"author"];
    self.usernameDetail.text = user.username;
    
//    NSTimer *_Nullable timePosted = _post.createdAt;
    
//    self.timeDetail.text = timePosted.timeAgoSinceNow;
    
    PFFileObject *pfobj = _post[@"image"];
    NSURL *posterURL = [NSURL URLWithString: pfobj.url];
    self.imageDetail.image = nil;
    [self.imageDetail setImageWithURL:posterURL];
}


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
