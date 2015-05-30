//
//  EditController.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "EditController.h"

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
- (IBAction)firstNameChanged:(id)sender {
    self.contact.firstName = [sender text];
    [self.delegate contactChanged];
}
- (IBAction)lastNameChanged:(id)sender {
    self.contact.lastName = [sender text];
    [self.delegate contactChanged];
}
- (IBAction)dobChanged:(id)sender {
    NSString* dateString = [sender text];
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    NSDate* date = [format dateFromString:dateString];
    self.contact.birthDate = date;
    [self.delegate contactChanged];
}
- (IBAction)phoneChanged:(id)sender {
    self.contact.phoneNumber = [sender text];
    [self.delegate contactChanged];
}
- (IBAction)emailChanged:(id)sender {
    self.contact.email = [sender text];
    [self.delegate contactChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
