//
//  BGViewController.m
//  Finder
//
//  Created by Brian Gaume on 1/2/14.
//  Copyright (c) 2014 Brian Gaume. All rights reserved.
//

#import "BGViewController.h"

@interface BGViewController ()

@end

@implementation BGViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    tableNames = [[BGSurfer sharedSurfer] getListing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://www.appcoda.com/uitableview-tutorial-storyboard-xcode5/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableNames objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *fileName = [tableNames objectAtIndex:indexPath.row];
    
    [[BGSurfer sharedSurfer] changeDirectory:fileName];
    [self viewDidLoad];
}

- (IBAction)disconnectBtn:(UIButton *)sender {
    // TODO: .. make disconnect and connect swappable
    NSString *title = [(UIButton *)sender currentTitle];
    if ([title isEqualToString:@"Disconnect"]) { // connect
        [[BGSurfer sharedSurfer] disconnectFromHost];
        
    } else if( [title isEqualToString:@"Connect"]) {
        
    }
}

@end
