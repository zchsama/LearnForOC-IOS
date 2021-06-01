//
//  Item.h
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) int valueInDollars;
@property (nonatomic, nullable, copy) NSString *serialNumber;
@property (nonatomic, copy) NSDate *dateCreate;

- (instancetype) initWithName: (NSString *) theName  andSerialNumber: (NSString *) theSerialNumber andValueInDollars: (int) theValueinDollars;

- (instancetype) initWithRandom: (BOOL) rand;
@end

NS_ASSUME_NONNULL_END
