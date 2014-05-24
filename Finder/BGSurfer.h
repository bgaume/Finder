//
//  BGSurfer.h
//  Finder
//
//  Created by Brian Gaume on 3/21/14.
//  Copyright (c) 2014 Brian Gaume. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <NMSSH/NMSSH.h>

#import </Users/Gaume/Projs/Finder/NMSSH.framework/Versions/A/Headers/NMSSH.h>
#import "BGViewController.h"

@interface BGSurfer : NSObject{
    NSString *SSHReturnString;
    NSString *user;
    NSString *host;
    NMSSHSession *session;
}

+ (BGSurfer *)sharedSurfer;

-(NSArray *)getListing;
-(void)changeDirectory:(NSString *)inDir;

- (void)disconnectFromHost;
- (bool)connectToServer:(NSString *)inServer withUser:(NSString *)inUser;

@end