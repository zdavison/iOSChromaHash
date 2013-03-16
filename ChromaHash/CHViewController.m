//
//  CHViewController.m
//  ChromaHash
//
//  Created by Zachary Davison on 15/03/2013.
//  Copyright (c) 2013 thingsdoer. All rights reserved.
//

#import "CHViewController.h"

@interface CHViewController ()

@end

@implementation CHViewController

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

#pragma mark - UI events
-(IBAction)plusButtonPressed:(id)sender{
    if(self.textField.barCount < 3)
        self.textField.barCount++;
}

-(IBAction)minusButtonPressed:(id)sender{
    if(self.textField.barCount > 1)
        self.textField.barCount--;
}

@end
