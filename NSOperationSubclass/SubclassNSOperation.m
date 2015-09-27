//
//  SubclassNSOperation.m
//  NSOperationSubclass
//
//  Created by Admin on 27.09.15.
//  Copyright (c) 2015 Olha Fizer. All rights reserved.
//

#import "SubclassNSOperation.h"

@implementation SubclassNSOperation
@synthesize arrayOfNumbers=_arrayOfNumbers;

- (id) initWithRandomArray
{
    self=[super init];
    if (self)
    {
        _arrayOfNumbers=[[NSMutableArray alloc]init];
        for (NSUInteger i=0; i<10; i++)
        {
            [_arrayOfNumbers addObject:@(arc4random_uniform(30))];
        }
        executing = NO;
        finished = NO;
    }
   //NSLog(@"Init: %@", [NSThread currentThread]);
    return self;
}

- (NSString*) arrayDescription
{
    NSString * arrayString = [[NSString alloc]init];
    for (NSUInteger i = 0; i < self.arrayOfNumbers.count; i++)
    {
        arrayString = [arrayString stringByAppendingString:
                       [NSString stringWithFormat:@"%@, ", self.arrayOfNumbers[i]]];
    }
    return arrayString;
}

#pragma mark - Override methods

- (BOOL) isExecuting
{
    return executing;
}

- (BOOL) isFinished
{
    return finished;
}

- (BOOL) isConcurrent
{
    return YES;
}

- (void) start
{
    if ([self isCancelled])
    {
        finished = YES;
        return;
    }
    
    executing = YES;
    [self main];
}

- (void) completeOperation
{
    executing = NO;
    finished = YES;
}
- (void) main
{
    NSInteger sum = 0;
    for (NSUInteger i = 0; i < self.arrayOfNumbers.count; i++)
    {
        sum+=[self.arrayOfNumbers[i] integerValue];
    }
    //NSLog(@"%@", [NSThread currentThread]);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Array of Numbers: %@", [self arrayDescription]);
        NSLog(@"Sum of numbers is %ld", sum);
        NSLog(@"Arithmetic mean for array of numbers is %.1f \n",
              (double)sum/self.arrayOfNumbers.count);
        NSLog(@"\n");
    });
    
    [self completeOperation];
}


@end
