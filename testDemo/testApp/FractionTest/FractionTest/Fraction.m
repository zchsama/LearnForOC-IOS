//
//  Fraction.m
//  FractionTest
//
//  Created by zhangchenhua on 2021/5/21.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

- (void) print
{
    NSLog(@"%i/%i", numerator, denominator);
}

- (double) convertToNum
{
    if(denominator != 0){
        return (double) numerator / denominator;
    }
    else
        return NAN;
}

@end
