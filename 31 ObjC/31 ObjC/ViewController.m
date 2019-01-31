//
//  ViewController.m
//  31 ObjC
//
//  Created by Johan Wigmo on 2019-01-31.
//  Copyright © 2019 Newton. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "_1_ObjC-Swift.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController {
    
    NSMutableArray<Person *> *people;
    
}

@synthesize test;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self populate];
    
    Work *work = [[Work alloc] initWithName:@"Name"];
    NSString *name = work.name;
    NSLog(@"Work name: %@", name);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Person *person = people[indexPath.row];
    
    cell.textLabel.text = person.name;
    
    NSString *detail = [NSString stringWithFormat:@"%@ (%i)", person.nickname, person.age];
    cell.detailTextLabel.text = detail;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)populate
{
    people = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<30; i++) {
        Person *person = [[Person alloc] initWithName:@"Kalle" age:i*6 andNickname:@"Pettersson"];
        [people addObject:person];
    }
    
    [self.tableView reloadData];
}



@end
