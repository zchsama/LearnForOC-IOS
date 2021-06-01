//
//  ItemsTableViewController.h
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/30.
//

#import <UIKit/UIKit.h>
#import "ItemStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemsTableViewController : UITableViewController

@property (nonatomic, strong) ItemStore *itemStore;

@end

NS_ASSUME_NONNULL_END
