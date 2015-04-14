//
//  ContactViewController.h
//  R&BLive-2014
//
//  Created by GERNiE B. on 3/2/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ContactViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)email;

@end
