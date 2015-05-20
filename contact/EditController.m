//
//  EditController.m
//  contact
//
//  Created by Discovery on 2015/05/11.
//  Copyright (c) 2015 Discovery. All rights reserved.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFirstNameChange:(UITextField *)sender {
    self.contact.firstName = sender.text;
    [self.delegate contactChanged];
}

- (IBAction)onLastNameChange:(UITextField *)sender {
    self.contact.lastName = sender.text;
    [self.delegate contactChanged];
}

- (IBAction)onDoBChange:(UITextField *)sender {
    NSString* dateString = sender.text;
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    NSDate* date = [format dateFromString:dateString];
    self.contact.birthDate = date;
    [self.delegate contactChanged];
}

- (IBAction)onPhoneChange:(UITextField *)sender {
    self.contact.phoneNumber = sender.text;
    [self.delegate contactChanged];
}

- (IBAction)onEmailChange:(UITextField *)sender {
    self.contact.email = sender.text;
    [self.delegate contactChanged];
}

@end
