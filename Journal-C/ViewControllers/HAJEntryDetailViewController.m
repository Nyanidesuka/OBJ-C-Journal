//
//  HAJEntryDetailViewController.m
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJEntryDetailViewController.h"
#import "HAJEntryController.h"
#import "HAJEntry.h"
@interface HAJEntryDetailViewController ()
//outlets go up here. Theyre not quiet properties. But they're interface. so they go here.
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation HAJEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_entry){
        [self updateViewsWithEntry:_entry];
    }
}

//Buttons
- (IBAction)clearButtonTapped:(UIButton *)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (IBAction)savebuttonTapped:(UIBarButtonItem *)sender {
    if (self.entry != nil){
        self.entry.title = self.titleTextField.text;
        self.entry.textBody = self.bodyTextView.text;
    } else {
        HAJEntry *newEntry = [[HAJEntry alloc] initWithTitle:self.titleTextField.text body:self.bodyTextView.text];
        [[HAJEntryController shared]addEntry:newEntry];
        
        NSLog(@"New Entry: %@", newEntry.title);
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (void)updateViewsWithEntry:(HAJEntry *)entry
{
    self.titleTextField.text = entry.title;
    self.bodyTextView.text = entry.textBody;
}
//the resign first responder function
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.titleTextField resignFirstResponder];
    return true;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
