//
//  main.m
//  testApp
//
//  Created by zhangchenhua on 2021/5/21.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject

- (void) setReal: (double) a;
- (void) setImaginary: (double) b;
- (void) print;
- (double) real;
- (double) imaginary;
    
@end

@implementation Complex
{
    double real;
    double imaginary;
}

- (void) setReal:(double)a{
    real = a;
}

- (void) setImaginary:(double)b{
    imaginary = b;
}

- (void) print{
    NSLog(@"the value is %f+%fi",real,imaginary);
}

- (double) real{
    return real;
}

- (double) imaginary{
    return imaginary;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Complex * newComlpex = [[Complex alloc] init];
        id number = [[Complex alloc] init];
        
        [newComlpex isMemberOfClass:[NSObject class]];
        [newComlpex isKindOfClass:[NSObject class]];
        
    }
    return 0;
}
