//
//  Item.m
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import "Item.h"

@implementation Item

- (instancetype) initWithName: (NSString *) theName  andSerialNumber: (NSString *) theSerialNumber andValueInDollars: (int) theValueinDollars
{
    self = [super init];
    if(self){
        self.name = theName;
        self.valueInDollars = theValueinDollars;
        self.serialNumber = theSerialNumber;
        self.dateCreate = [NSDate date];
    }
    
    return self;
}

- (instancetype) initWithRandom:(BOOL) rand
{
    
    if(rand){
        NSArray *adjectives = @[@"Fluffy",@"Rusty",@"Shiny"];
        NSArray *nouns = @[@"Bear",@"Spork",@"Mac"];
        
        int idx = arc4random_uniform((UInt32)adjectives.count);
        NSString *randomAjective = adjectives[idx];
        
        idx = arc4random_uniform((UInt32)nouns.count);
        NSString *randomNouns = nouns[idx];
        
        NSString *randomName = [NSString stringWithFormat:@"%@ %@",randomAjective, randomNouns];
        int randomValue = arc4random_uniform(100);
        NSString *randomSerialNumber = [[NSUUID UUID].UUIDString componentsSeparatedByString:@"-"].firstObject;
        
        //NSLog(@"initwithRandom call: %@", self);
        
        return  [self initWithName:randomName andSerialNumber:randomSerialNumber andValueInDollars:randomValue];
        
        
     }
    
    else{
        //NSLog(@"initwithRandom call: %@", self);
        return [self initWithName:@"" andSerialNumber:nil andValueInDollars:0];
    }
    
    
}



@end
