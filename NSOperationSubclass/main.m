//
//  main.m
//  NSOperationSubclass
//
//  Created by Admin on 27.09.15.
//  Copyright (c) 2015 Olha Fizer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SubclassNSOperation.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        NSOperationQueue * queue = [[NSOperationQueue alloc]init];
        
        for (NSUInteger i = 0; i < 5; i++)
        {
            [queue addOperation:[[SubclassNSOperation alloc] initWithRandomArray]];
        }
        
       [queue setSuspended:YES];
       [queue addOperationWithBlock:^{
           NSLog(@"----------Some random operation-------------");
       }];
       [queue setSuspended:NO];
        
              
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
