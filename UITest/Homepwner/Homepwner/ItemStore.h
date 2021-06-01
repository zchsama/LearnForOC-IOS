//
//  ItemStore.h
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import <Foundation/Foundation.h>
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemStore : NSObject

@property (nonatomic, strong) NSMutableArray *items;

- (void) createItem;
- (Item *) createItem: (ItemStore *) theItemStore;
- (void) removeItem: (Item *) targetItem;
- (void) moveItemFrom: (NSUInteger) fromIndex to: (NSUInteger) toIndex;
@end

NS_ASSUME_NONNULL_END
