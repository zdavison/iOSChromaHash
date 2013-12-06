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


    UIView *leftSizeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    leftSizeView.backgroundColor = [UIColor darkGrayColor];

    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = leftSizeView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI events
-(IBAction)plusButtonPressed:(id)sender{
    if(self.textField.barCount < 4)
        self.textField.barCount++;
}

-(IBAction)minusButtonPressed:(id)sender{
    if(self.textField.barCount > 1)
        self.textField.barCount--;
}

@end
