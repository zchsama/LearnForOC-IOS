//
//  AddressCard.h
//  Address
//
//  Created by zhangchenhua on 2021/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressCard : NSObject

@property (copy, nonatomic) NSString *name, *email;

- (void) print;
- (void) setName:(NSString *)theName andEmail: (NSString *)theEmail;
- (NSComparisonResult) compareNames: (id) element;

@end

NS_ASSUME_NONNULL_END
