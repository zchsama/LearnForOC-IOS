//
//  AddressCard.m
//  Address
//
//  Created by zhangchenhua on 2021/5/24.
//

#import "AddressCard.h"

@implementation AddressCard

@synthesize email,name;

- (void) print
{
    NSLog(@"====================");
    NSLog(@"|             |");
    NSLog(@"|  %@  |", name);
    NSLog(@"|  %@  |", email);
    
}

- (void) setName:(NSString *)theName andEmail:(NSString *)theEmail
{
    self.name = theName;
    self.email = theEmail;
}

- (NSComparisonResult) compareNames: (id) element
{
    return [name compare: [element name]];
}
@end
