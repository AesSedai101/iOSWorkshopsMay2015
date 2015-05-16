//
//  ContactsTableViewController.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/16.
//  Copyright (c) 2015 Discovery. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "Contact.h"
#import "Contact+ContactInitialiserAdditions.h"
#import "ViewController.h"

@interface ContactsTableViewController ()
@property NSArray* contacts;
@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* steveVals = @{@"firstName":@"Steve",@"lastName":@"Woz",@"email":@"a@b.c",@"phone":@"012 345 6789",@"birth":@"1 Jan 1970"};
    Contact* steve = [[Contact alloc] initFromDictionary:steveVals];
    
    NSDictionary* randVals = @{@"firstName":@"Rand",@"lastName":@"al'Thor",@"email":@"a@b.c",@"phone":@"012 345 6789",@"birth":@"1 Jun 1982"};
    Contact * rand = [[Contact alloc] initFromDictionary:randVals];
    
    self.contacts = @[steve, rand];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Contact * thisContact = [self.contacts objectAtIndex:indexPath.row];
    cell.textLabel.text = thisContact.fullName;
    cell.detailTextLabel.text = thisContact.phoneNumber;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showSegue" sender:self];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSInteger index = [self.tableView indexPathForSelectedRow].row;
    Contact* selected = [self.contacts objectAtIndex:index];
    
    ViewController* controller = [segue destinationViewController];
    controller.contact = selected;
}


@end
