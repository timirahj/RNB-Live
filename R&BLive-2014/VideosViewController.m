//
//  VideosViewController.m
//  R&BLive-2014
//
//  Created by GERNiE B. on 3/2/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import "VideosViewController.h"

@interface VideosViewController ()

@end

@implementation VideosViewController
@synthesize videosWebView;

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
    NSString *urlAddress = @"http://www.youtube.com/rnblivestream";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [videosWebView loadRequest:requestObj];	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
