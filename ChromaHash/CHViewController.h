//
//  CHViewController.h
//  ChromaHash
//
//  Created by Zachary Davison on 15/03/2013.
//  Copyright (c) 2013 thingsdoer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTextField.h"

@interface CHViewController : UIViewController

@property(nonatomic,weak)IBOutlet CHTextField *textField;

-(IBAction)plusButtonPressed:(id)sender;
-(IBAction)minusButtonPressed:(id)sender;

@end
