//
//  SharePhotosViewController.h
//  R&BLive-2014
//
//  Created by GERNiE B. on 2/28/14.
//  Copyright (c) 2014 GERNiE B. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SharePhotosViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIDocumentInteractionControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageViewer;
@property (strong, nonatomic) IBOutlet UIButton *capturePhoto;

- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;
- (IBAction)share:(id)sender;

@end
