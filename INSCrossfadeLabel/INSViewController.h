//
//  INSViewController.h
//  Berlin Insomniac
//
//  Created by Salánki, Benjamin on 02/07/14.
//  Copyright (c) 2014 Berlin Insomniac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "INSCrossfadeLabel.h"

@interface INSViewController : UIViewController

@property (nonatomic, weak) IBOutlet INSCrossfadeLabel *label;

- (IBAction)crossfade:(id)sender;

@end
