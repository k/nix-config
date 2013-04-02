//
//  main.m
//  myfind
//
//  Created by Kenneth Bambridge on 3/8/13.
//  Copyright (c) 2013 Kenneth Bambridge. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSFileManager *fm = [NSFileManager defaultManager];
        NSProcessInfo *proc = [NSProcessInfo processInfo];
        NSString *start, *file;
        NSArray *args = [proc arguments];
        w
        if ([args count] != 3) {
            NSLog (@"Usage: %@ start file", [proc processName]);
            return 1;
        }
        start =[[fm currentDirectoryPath] stringByAppendingPathComponent: args[1]];
        NSLog(@"%@", start);
        
        BOOL *dir = NULL;
        
        if (![fm fileExistsAtPath:start isDirectory:dir] )
        {
            if (!dir) start = [fm currentDirectoryPath];
            else {
                NSLog(@"Starting point must be a directory!");
                return 2;
            }
        }
        NSLog( @"%@", start);
        
        NSDirectoryEnumerator *dirs = [fm enumeratorAtPath:start];

        while (file = [dirs nextObject])
        {
            if ([[file lastPathComponent] isEqualToString:args[2]]) {
                NSDictionary *atts = [dirs fileAttributes];
                start = atts[@"path"];
                NSLog(@"%@", start);
                return 0;
            }
        }
        
        NSLog(@"File not found!");
    }
    return 0;
}

