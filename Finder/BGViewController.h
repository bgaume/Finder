//
//  BGViewController.h
//  Finder
//
//  Created by Brian Gaume on 1/2/14.
//  Copyright (c) 2014 Brian Gaume. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BGSurfer.h"

@interface BGViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableNames;
    NSSet *endTouch;
    UIEvent *uievent;
}

- (IBAction)disconnectBtn:(UIButton *)sender;

@end