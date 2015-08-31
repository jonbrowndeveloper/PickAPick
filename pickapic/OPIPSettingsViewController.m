//
//  OPIPSettingsViewController.m
//  pickapic
//
//  Created by Steve Brown on 8/30/15.
//  Copyright (c) 2015 D&GVentures. All rights reserved.
//

#import "OPIPSettingsViewController.h"

@interface OPIPSettingsViewController ()

@end

@implementation OPIPSettingsViewController

@synthesize timerControlOutlet, gameTypeControlOutlet, numberStepperOutlet, gameTypeNumber, numberLabel;

- (void)viewDidLoad
{
    double timerValue = [[NSUserDefaults standardUserDefaults] doubleForKey:@"gameTimer"];
    
    if ((int)timerValue == 30)
    {
        timerControlOutlet.selectedSegmentIndex = 0;

    }
    else if ((int)timerValue == 60)
    {
        timerControlOutlet.selectedSegmentIndex = 1;

    }
    else if ((int)timerValue == 90)
    {
        timerControlOutlet.selectedSegmentIndex = 2;
    }
    
    timerControlOutlet.selectedSegmentIndex = (int)timerValue;
    
    BOOL gameType = [[NSUserDefaults standardUserDefaults] boolForKey:@"isRounds"];
    if (gameType == YES)
    {
        gameTypeControlOutlet.selectedSegmentIndex = 0;
    }
    else if (gameType == NO)
    {
        gameTypeControlOutlet.selectedSegmentIndex = 1;
    }
    
    gameTypeNumber = (int)[[NSUserDefaults standardUserDefaults] doubleForKey:@"numberOfRoundsOrPoints"];
    
    numberLabel.text = [NSString stringWithFormat:@"%d", gameTypeNumber];
    
    numberStepperOutlet.value = (double)gameTypeNumber;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)numberStepper:(UIStepper *)sender
{
    
    double numberDouble = sender.value;

    if (numberDouble > 0)
    {
        numberLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
        
        [[NSUserDefaults standardUserDefaults] setDouble:numberDouble forKey:@"numberOfRoundsOrPoints"];
    }
    
}

- (IBAction)timerControl:(id)sender
{
    if (timerControlOutlet.selectedSegmentIndex == 0)
    {
        double value = 30;
        [[NSUserDefaults standardUserDefaults] setDouble:value forKey:@"gameTimer"];
    }
    else if (timerControlOutlet.selectedSegmentIndex == 1)
    {
        double value = 60;
        [[NSUserDefaults standardUserDefaults] setDouble:value forKey:@"gameTimer"];
    }
    else if (timerControlOutlet.selectedSegmentIndex == 2)
    {
        double value = 90;
        [[NSUserDefaults standardUserDefaults] setDouble:value forKey:@"gameTimer"];
    }
}

- (IBAction)gameTypeControl:(id)sender
{
    if (gameTypeControlOutlet.selectedSegmentIndex == 0)
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isRounds"];
    }
    else if (gameTypeControlOutlet.selectedSegmentIndex == 1)
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isRounds"];
    }
}
@end
