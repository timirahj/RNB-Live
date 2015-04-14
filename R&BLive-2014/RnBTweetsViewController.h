//
//  RnBTweetsViewController.h
//  R&BLive-2014
//
//  Created by GERNiE B. on 2/27/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface RnBTweetsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweets;

@end

