//
//  Fraction.h
//  FractionTest
//
//  Created by zhangchenhua on 2021/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
- (double) convertToNum;

@end

NS_ASSUME_NONNULL_END
