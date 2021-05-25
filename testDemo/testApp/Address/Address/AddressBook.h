//
//  AddressBook.h
//  Address
//
//  Created by zhangchenhua on 2021/5/24.
//

#import <Foundation/Foundation.h>
#import "AddressCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddressBook : NSObject

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

- (instancetype) initWithName: (NSString *) name;
- (void) addCard: (AddressCard *) theCard;
- (int) entries;
- (void) list;
- (void) sort;

@end

NS_ASSUME_NONNULL_END
