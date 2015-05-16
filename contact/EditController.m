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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
