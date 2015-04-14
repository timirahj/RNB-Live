//
//  NewViewController.m
//  R&BLive-2014
//
//  Created by GERNiE B. on 2/26/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import "NewViewController.h"
#import "MessageUI/MessageUI.h"

@interface NewViewController ()

@end

@implementation NewViewController


- (IBAction)emailButton:(id)sender {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc]init];
    [composer setMailComposeDelegate:self];
    
    if ([MFMailComposeViewController canSendMail])
    {
        [composer setToRecipients:[NSArray arrayWithObject:@"gernieb2011@gmail.com"]];
        [composer setSubject:@"Subject"];
        [composer setMessageBody:@"Message" isHTML:NO];
        [composer setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"error" message:[NSString stringWithFormat:@"error %@", [error description]] delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end