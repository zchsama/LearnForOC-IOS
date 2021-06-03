//
//  Photo.h
//  Photorama
//
//  Created by zhangchenhua on 2021/6/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *photoID;
@property (nonatomic) NSURL *remoteURL;
@property (nonatomic) NSDate *dateTaken;

- (instancetype) initWithTitle:(NSString *) title andPhotoID :(NSString *) photoID andRemoteURL :(NSURL *)remoteURL andDateTaken :(NSDate *)dateTaken;

@end

NS_ASSUME_NONNULL_END
