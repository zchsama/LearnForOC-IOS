//
//  AddressBook.m
//  Address
//
//  Created by zhangchenhua on 2021/5/24.
//
#import <Foundation/Foundation.h>
#import "AddressBook.h"

@implementation AddressBook

@synthesize book, bookName;

- (instancetype) initWithName:(NSString *) name
{
    self = [super init];
    
    if(self) {
        bookName = [NSString stringWithString: name];
        book = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype) init{
    return [self initWithName: @"NoName"];
}

- (void) addCard:(AddressCard *)theCard
{
    [book addObject:theCard];
}

- (int)entries
{
    return [book count];
}

- (void) list
{
    NSLog(@"====== Contents of: %@ ======", bookName);
    
    [book enumerateObjectsUsingBlock:
     ^(AddressCard *theCard, NSUInteger idx, BOOL *stop) {
        NSLog(@"%-20s %-32s", [theCard.name UTF8String],
              [theCard.email UTF8String]);
        NSLog(@"========================");
    }];
}

- (void) sort
{
    [book sortUsingSelector:@selector(compareNames:)];
}


@end
