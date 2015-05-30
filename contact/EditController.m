//
//  EditController.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "EditController.h"
#import "AppDelegate.h"

@interface EditController ()
@property (weak, nonatomic) IBOutlet UITextField *editFirstName;
@property (weak, nonatomic) IBOutlet UITextField *editLastName;
@property (weak, nonatomic) IBOutlet UITextField *editDateOfBirth;
@property (weak, nonatomic) IBOutlet UITextField *editPhone;
@property (weak, nonatomic) IBOutlet UITextField *editEmail;

@end

@implementation EditController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    
    self.editFirstName.text = self.contact.firstName;
    self.editLastName.text = self.contact.lastName;
    self.editDateOfBirth.text = [format stringFromDate:self.contact.birthDate];
    self.editPhone.text = self.contact.phoneNumber;
    self.editEmail.text = self.contact.email;
}

- (IBAction)onSave:(id)sender {
    
    self.contact.firstName = self.editFirstName.text;
    self.contact.lastName = self.editLastName.text;
    
    NSString* dateString = self.editDateOfBirth.text;
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    NSDate* date = [format dateFromString:dateString];
    self.contact.birthDate = date;

    self.contact.phoneNumber = self.editPhone.text;
    self.contact.email = self.editEmail.text;
    
    NSManagedObjectContext* context = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    [context save:nil];
    
    [self.delegate contactChanged];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
