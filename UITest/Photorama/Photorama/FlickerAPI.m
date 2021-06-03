//
//  FlickerAPI.m
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import "FlickerAPI.h"

NSString * const MethodsToString(Method key){
    switch (key) {
        case interestingPhotos:
            return @"flicker.interestingness.getList";
        
        default:
            break;
    }
}

static NSString *_baseURLString = @"https://www.flicker.com/services/rest/";
static NSString *APIKey = @"a6d819499131071f158fd740860a5a88";

@implementation FlickerAPI

+ (NSString *) baseURLString
{
    return _baseURLString;
}

+ (NSURL *) flickrURL:(NSString *) method andParameters: (NSDictionary *) parameters
{
    NSURLComponents *components = [NSURLComponents componentsWithString:[FlickerAPI baseURLString]];
    
    NSMutableArray *queryItems = [NSMutableArray arrayWithCapacity:5];
    NSDictionary *baseParams = @{
        @"method": method,
        @"format": @"json",
        @"nojsoncallback": @"1",
        @"api_key": APIKey
    };
    
    for(NSString *key in baseParams){
        NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:baseParams[key]];
        [queryItems addObject:item];
    }
    
    for(NSString *key in parameters){
        NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:key value:parameters[key]];
        [queryItems addObject:item];
    }
    
    components.queryItems = queryItems;
    
    NSString *tempURL = [NSString stringWithString:components.string];
    NSString *tempURLAfterEncode = [tempURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz./?=&_:1234567890QWERTYUIOPASDFGHJKLZXCVBNM"]];
    
    NSURL *url = [NSURL URLWithString:tempURLAfterEncode];
    
    
    return url;
}

+ (NSURL *) interestingPhotoURL
{
    NSString *extras = @"url_h,date_taken";
    
    
    return [FlickerAPI flickrURL:MethodsToString(interestingPhotos) andParameters:@{@"extras":extras}];
}

+ (PhotosResult) photoResult: (NSData *)data
{
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    if(jsonObject)
    {
        
        return PhotoResultSuccess;
    }
    else
    {
        return PhotoResultFailure;
    }
}
@end
