//
//  main.m
//  FractionTest
//
//  Created by zhangchenhua on 2021/5/21.
//

#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction = [[Fraction alloc] init];
        
        [myFraction setNumerator:1];
        [myFraction setDenominator:3];
        
        [myFraction print];
    }
    return 0;
}
