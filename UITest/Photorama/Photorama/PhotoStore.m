//
//  PhotoStore.m
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import "PhotoStore.h"
#import "FlickerAPI.h"

@implementation PhotoStore

- (instancetype) init
{
    self = [super init];
    if(self)
    {
        NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
        self.session = [NSURLSession sessionWithConfiguration:config];
        
    }
    return self;
}

- (void) fetchInterestingPhotos
{
    NSURL *url = FlickerAPI.interestingPhotoURL;
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:req completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@", jsonObject);
    }];
    [task resume];
    
    
}

@end
