//
//  NewViewController.h
//  R&BLive-2014
//
//  Created by GERNiE B. on 2/26/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface NewViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)emailButton:(id)sender;

@end
