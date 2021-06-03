//
//  FlickerAPI.h
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, Method) {
    interestingPhotos
};

typedef NS_ENUM(NSInteger, PhotosResult){
    PhotoResultSuccess,
    PhotoResultFailure
};

extern NSString * const MethodsToString(Method key);

@interface FlickerAPI : NSObject

@property (class, nonatomic, readonly) NSString *baseURLString;
@property (class, nonatomic, readonly) NSURL *interestingPhotoURL;

+ (PhotosResult) photoResult: (NSData *) data;
 
@end

NS_ASSUME_NONNULL_END
