//
//  GuestViewController.m
//  R&BLive-2014
//
//  Created by GERNiE B. on 3/2/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import "GuestViewController.h"

@interface GuestViewController ()

@end

@implementation GuestViewController
@synthesize guestWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super viewDidLoad];
    NSString *urlAddress = @"http://www.rnblive.com";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [guestWebView loadRequest:requestObj];	// Do any additional setup after loading the view.
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
