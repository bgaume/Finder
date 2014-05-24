//
//  BGSurfer.m
//  Finder
//
//  Created by Brian Gaume on 3/21/14.
//  Copyright (c) 2014 Brian Gaume. All rights reserved.
//

#import "BGSurfer.h"

static BGSurfer* _surfer;

@implementation BGSurfer

#pragma mark Singleton Methods

+ (BGSurfer *)sharedSurfer {
    @synchronized(self){
        if (_surfer == nil) {
            _surfer = [[self alloc] init];
        }
    }
    return _surfer;
}

- (id)init {
    if (self = [super init]) {
        SSHReturnString = @"Default Property Value";
    }
    
    [self connectToServer:@"10.0.1.101" withUser:@"pi"];
    
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

-(NSArray *)getListing{
    NSError *error = nil;
    
    //SSHReturnString = [session.channel execute:@"pwd" error:&error];
    SSHReturnString = [session.channel execute:@"ls -1" error:&error];
    //SSHReturnString = [session.channel execute:@"cd /home/pi/python_games; ls -1" error:&error];
    
    NSArray *dirLsting =[SSHReturnString componentsSeparatedByString:@"\n"];

    return dirLsting;
}

- (bool)connectToServer:(NSString *)inServer withUser:(NSString *)inUser
{
    session = [NMSSHSession connectToHost:inServer withUsername:inUser];
    if (session.isConnected) {
        [session authenticateByPassword:@"raspberry"];
    
        if (session.isAuthorized) {
            NSLog(@"Authentication succeeded");
        }
    }

    return false;
}

- (void)disconnectFromHost
{
    [session disconnect];
}

-(void)changeDirectory:(NSString *)inDir
{
    NSError *error = nil;
    
    NSString *cmd = [NSString stringWithFormat:@"cd %@",inDir ]; //libssh2 has methods for changing the working directory but they are not implemented in NMSSH. (https://github.com/Lejdborg/NMSSH/issues/3) ...N
    SSHReturnString = [session.channel execute:cmd error:&error];
    
    NSArray *tmp = [[BGSurfer sharedSurfer] getListing];
    
    NSLog( @"inDir: %@\npwd: ",inDir );
    NSLog((NSString *)[session.channel execute:@"cd /" error:&error]);
    NSLog((NSString *)[session.channel execute:@"pwd" error:&error]);
    
}


@end
