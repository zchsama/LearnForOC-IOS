//
//  PhotoStore.h
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoStore : NSObject

@property (nonatomic) NSURLSession *session;

- (void) fetchInterestingPhotos;

@end

NS_ASSUME_NONNULL_END
