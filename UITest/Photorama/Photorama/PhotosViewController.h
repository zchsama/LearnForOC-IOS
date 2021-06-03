//
//  PhotosViewController.h
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import <UIKit/UIKit.h>
#import "PhotoStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosViewController : UIViewController

@property (nonatomic, strong) PhotoStore *store;

@end

NS_ASSUME_NONNULL_END
