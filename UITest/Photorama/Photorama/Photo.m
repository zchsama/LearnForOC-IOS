//
//  Photo.m
//  Photorama
//
//  Created by zhangchenhua on 2021/6/3.
//

#import "Photo.h"

@implementation Photo

- (instancetype) initWithTitle:(NSString *) title andPhotoID :(NSString *) photoID andRemoteURL :(NSURL *)remoteURL andDateTaken :(NSDate *)dateTaken
{
    self = [super init];
    if(self)
    {
        self.title = title;
        self.dateTaken = dateTaken;
        self.remoteURL = remoteURL;
        self.photoID = photoID;
    }
    return self;
}

@end
