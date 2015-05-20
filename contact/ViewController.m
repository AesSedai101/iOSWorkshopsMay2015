//
//  ViewController.m
//  contact
//
//  Created by Discovery on 2015/04/24.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import "ViewController.h"
#import "EditController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *dateOfBirth;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (void) updateUI {
    NSDateFormatter* format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd LLLL yyyy"];
    
    self.fullName.text = self.contact.fullName;
    self.dateOfBirth.text = [format stringFromDate:self.contact.birthDate];
    self.phone.text = self.contact.phoneNumber;
    self.email.text = self.contact.email;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EditController* controller = [segue destinationViewController];
    controller.contact = self.contact;
    controller.delegate = self;
}

- (void)contactChanged {
    [self updateUI];
    [self.delegate contactChanged];
}

@end
