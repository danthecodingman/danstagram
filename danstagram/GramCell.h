//
//  GramCell.h
//  danstagram
//
//  Created by danielavila on 7/9/19.
//  Copyright © 2019 danielavila. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GramCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *homeImage;
@property (weak, nonatomic) IBOutlet UITextView *homeCaption;
@property (weak, nonatomic) IBOutlet UILabel *homeUser;

@end

NS_ASSUME_NONNULL_END
