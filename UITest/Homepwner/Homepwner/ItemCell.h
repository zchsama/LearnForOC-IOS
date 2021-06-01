//
//  ItemCell.h
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *serialNumberLabel;
@property (nonatomic, strong) UILabel *valueLabel;

- (void) setCellUI;

@end

NS_ASSUME_NONNULL_END
