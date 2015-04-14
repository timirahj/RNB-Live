//
//  RnBTweetsViewController.m
//  R&BLive-2014
//
//  Created by GERNiE B. on 2/27/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import "RnBTweetsViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface RnBTweetsViewController ()

@property (nonatomic,strong) ACAccountStore *accountStore;

@end


@implementation RnBTweetsViewController
@synthesize tweets;


#pragma mark -
#pragma mark UITableViewDataSource

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self getTimeLine];
}

- (void)getTimeLine {
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account
                                  accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType
                                     options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted == YES)
         {
             NSArray *arrayOfAccounts = [account
                                         accountsWithAccountType:accountType];
             
             if ([arrayOfAccounts count] > 0)
             {
                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                 
                 NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json?q=%23rnblive"];
                 
                 NSMutableDictionary *parameters =
                 [[NSMutableDictionary alloc] init];
                 [parameters setObject:@"35" forKey:@"count"];
                 [parameters setObject:@"1" forKey:@"include_entities"];
                 
                  
                    //prints user: tweet
                 
                 SLRequest *postRequest = [SLRequest
                                           requestForServiceType:SLServiceTypeTwitter
                                           requestMethod:SLRequestMethodGET
                                           URL:requestURL parameters:parameters];
                 
                 postRequest.account = twitterAccount;
                 
                 [postRequest performRequestWithHandler:
                  ^(NSData *responseData, NSHTTPURLResponse
                    *urlResponse, NSError *error)
                  {
                      self.tweets = [NSJSONSerialization
                                      JSONObjectWithData:responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&error];
                      
                      if (self.tweets.count != 0) {
                          dispatch_async(dispatch_get_main_queue(), ^{
                              [self.tableView reloadData];
                          });
                      }
                  }];
             }
         } else {
             // Handle failure to get account access
         }
     }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];
    NSString *text = [tweet objectForKey:@"text"];
    NSString *name = [[tweet objectForKey:@"user"] objectForKey:@"name"];
    
    cell.textLabel.text = text;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"by %@", name];
    
    for (NSDictionary *tweet in tweets) {
        
        NSLog(@"%@: %@", [tweet objectForKey:@"from_user"], [tweet objectForKey:@"text"]);
    }
    return cell;
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end