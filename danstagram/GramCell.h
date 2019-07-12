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
@property (weak, nonatomic) IBOutlet UILabel *homeUser;
@property (weak, nonatomic) IBOutlet UILabel *homeLikeCount;
@property (weak, nonatomic) IBOutlet UILabel *homeCommentCount;
@property (weak, nonatomic) IBOutlet UILabel *homeCaption;

@end

NS_ASSUME_NONNULL_END
