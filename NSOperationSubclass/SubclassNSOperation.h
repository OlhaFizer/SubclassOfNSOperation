//
//  SubclassNSOperation.h
//  NSOperationSubclass
//
//  Created by Admin on 27.09.15.
//  Copyright (c) 2015 Olha Fizer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubclassNSOperation : NSOperation
{
    BOOL executing;
    BOOL finished;
}

@property (strong, nonatomic) NSMutableArray * arrayOfNumbers;

- (id) initWithRandomArray;
- (void) completeOperation;

@end
