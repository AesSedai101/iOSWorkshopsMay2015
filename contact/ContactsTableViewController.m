//
//  ContactsTableViewController.m
//  contact
//
//  Created by Elsabe Ros on 2015/05/27.
//  Copyright (c) 2015 Elsabe Ros. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "Contact+Additions.h"
#import "ViewController.h"

@interface ContactsTableViewController ()
@property NSMutableArray* contacts;
@property NSArray* alphabet;
@end

@implementation ContactsTableViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.alphabet = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    NSDictionary* steveVals = @{@"firstName":@"Steve",@"lastName":@"Woz",@"email":@"a@b.c",@"phone":@"012 345 6789",@"birth":@"1 Jan 1970"};
    Contact* steve = [[Contact alloc] initFromDictionary:steveVals];
    
    NSDictionary* randVals = @{@"firstName":@"Rand",@"lastName":@"al'Thor",@"email":@"a@b.c",@"phone":@"012 333 6789",@"birth":@"1 Jun 1982"};
    Contact * rand = [[Contact alloc] initFromDictionary:randVals];
    
    NSDictionary* zippyVals = @{@"firstName":@"Zippy",@"lastName":@"Z",@"email":@"Z@z.z",@"phone":@"012 345 7777",@"birth":@"13 Jun 1992"};
    Contact * zippy = [[Contact alloc] initFromDictionary:zippyVals];
    
    NSDictionary* bobVals = @{@"firstName":@"Bob",@"lastName":@"Woz",@"email":@"a@b.c",@"phone":@"012 345 9999",@"birth":@"1 Jul 1985"};
    Contact* bob = [[Contact alloc] initFromDictionary:bobVals];
    
    self.contacts = [NSMutableArray arrayWithArray: @[steve, rand, zippy, bob]];
    
    [self.contacts sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Contact* c1 = obj1;
        Contact* c2 = obj2;
        NSComparisonResult result = [c1.lastName.uppercaseString compare:c2.lastName.uppercaseString];
        if (NSOrderedSame == result) {
            return [c1.firstName.uppercaseString compare:c2.firstName.uppercaseString];
        }
        return result;
    }];
    NSLog(@"Sorted list %@", self.contacts);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 26;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.alphabet;
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.alphabet objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 0;
    NSString* letterString = [self.alphabet objectAtIndex:section];
    unichar letter = [letterString characterAtIndex:0];
    
    for (Contact* contact in self.contacts) {
        if ([contact.lastName.uppercaseString characterAtIndex:0] == letter) {
            count++;
        }
    }
    NSLog(@"Counting strings in section %@ (%tu): %tu",letterString, section, count);
    return count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    
    NSInteger calcIndex = indexPath.row + [self calculateSectionStart:indexPath.section];
    
    // Configure the cell...
    Contact * thisContact = [self.contacts objectAtIndex:calcIndex];
    NSLog(@"Contact %ld in section %@: %@", (long)indexPath.row, [self.alphabet objectAtIndex:indexPath.section], thisContact.fullName);
    cell.textLabel.text = thisContact.fullName;
    
    return cell;
}

- (NSInteger) calculateSectionStart:(NSInteger) sectionIndex {
    NSString* section = [self.alphabet objectAtIndex:sectionIndex];
    NSInteger sectionStart = 0;
    for (Contact* c in self.contacts) {
        if ([c.lastName.uppercaseString compare:section] == NSOrderedAscending) {
            sectionStart++;
        }
    }
    return sectionStart;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath* indexPath = [self.tableView indexPathForSelectedRow];
    NSInteger index = [self calculateSectionStart:indexPath.section] + indexPath.row;
    Contact* selected = [self.contacts objectAtIndex:index];
    
    ViewController* controller = [segue destinationViewController];
    controller.contact = selected;
    controller.delegate = self;
}

- (void)contactChanged {
    [self.tableView reloadData];
}


@end
