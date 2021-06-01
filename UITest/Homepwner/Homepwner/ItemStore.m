//
//  ItemStore.m
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import "ItemStore.h"

@implementation ItemStore

- (void) createItem
{
    Item *newItem = [[Item alloc]  initWithRandom:YES];
    //NSLog(@"newItem is %@, %@", newItem.name,newItem.serialNumber);
    if(self.items.count != 0){
        [self.items addObject:newItem];
    }
    else{
        self.items = [NSMutableArray arrayWithCapacity:10];
        [self.items addObject:newItem];
    }
    
    
}

- (Item *) createItem: (ItemStore *) theItemStore
{
    Item *newItem = [[Item alloc]  initWithRandom:YES];
    //NSLog(@"newItem is %@, %@", newItem.name,newItem.serialNumber);
    if(theItemStore.items.count != 0){
        [theItemStore.items addObject:newItem];
    }
    else{
        theItemStore.items = [NSMutableArray arrayWithCapacity:10];
        [theItemStore.items addObject:newItem];
    }
    
    return newItem;
}

- (instancetype) init
{
    self = [super init];
    if(self){
        for(int number = 0; number < 5; number++){
            [self createItem];
        }
    }
    
    //NSLog(@"items init is call");
    return self;
}

- (void) removeItem: (Item *) targetItem
{
    NSUInteger index = [self.items indexOfObject:targetItem];
    [self.items removeObjectAtIndex:index];
}

- (void) moveItemFrom: (NSUInteger) fromIndex to: (NSUInteger) toIndex
{
    if(fromIndex == toIndex){
        return;
    }
    else
    {
        Item *moveItem = self.items[fromIndex];
        [self.items removeObjectAtIndex:fromIndex];
        [self.items insertObject:moveItem atIndex:toIndex];
    }
}

@end
