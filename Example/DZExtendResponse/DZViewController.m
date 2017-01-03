//
//  DZViewController.m
//  DZExtendResponse
//
//  Created by yishuiliunian on 01/03/2017.
//  Copyright (c) 2017 yishuiliunian. All rights reserved.
//

#import "DZViewController.h"
#import <DZExtendResponse/DZExtendResponse.h>

@interface DZViewController ()
@property (nonatomic, weak) IBOutlet UILabel* leftLabel;
@property (nonatomic, weak) IBOutlet UIStepper* leftStepper;

//
@property (nonatomic, weak) IBOutlet UILabel* topLabel;
@property (nonatomic, weak) IBOutlet UIStepper* topStepper;
//
@property (nonatomic, weak) IBOutlet UILabel* rightLabel;
@property (nonatomic, weak) IBOutlet UIStepper* rightStepper;
//
@property (nonatomic, weak) IBOutlet UILabel* bottomLabel;
@property (nonatomic, weak) IBOutlet UIStepper* bottomStepper;
//
@property (nonatomic, weak) IBOutlet UIButton * actionButton;
@end

@implementation DZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_leftStepper addTarget:self action:@selector(leftValueChange:) forControlEvents:UIControlEventTouchUpInside];
    [_rightStepper addTarget:self action:@selector(rightValueChange:) forControlEvents:UIControlEventTouchUpInside];
    [_topStepper addTarget:self action:@selector(topValueChange:) forControlEvents:UIControlEventTouchUpInside];
    [_bottomStepper addTarget:self action:@selector(bottomValueChange:) forControlEvents:UIControlEventTouchUpInside];

	// Do any additional setup after loading the view, typically from a nib.
}

#define IMP_VALUE_CHANGE(direction) \
- (IBAction) direction##ValueChange :(UIStepper*)sender \
{ \
    _##direction##Label.text = [NSString stringWithFormat:@"%d",(int)sender.value];\
    DZExtendResponse(_actionButton, UIEdgeInsetsMake(_topStepper.value, _leftStepper.value, _bottomStepper.value, _rightStepper.value));\
}

IMP_VALUE_CHANGE(left)
IMP_VALUE_CHANGE(right)
IMP_VALUE_CHANGE(top)
IMP_VALUE_CHANGE(bottom)

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) doAction:(id)sender
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"响应" message:@"响应了点击" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
