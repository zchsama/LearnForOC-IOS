//
//  ItemCell.m
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/31.
//

#import "ItemCell.h"
#import <Masonry/Masonry.h>

@implementation ItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.nameLabel.adjustsFontForContentSizeCategory = YES;
    self.valueLabel.adjustsFontForContentSizeCategory = YES;
    self.serialNumberLabel.adjustsFontForContentSizeCategory = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) init
{
    self = [super initWithFrame:CGRectMake(0, 0, UIViewAutoresizingFlexibleWidth, 65)];
    if(self){
        [self setCellUI];
    }
    return self;
}

- (void) setCellUI
{
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    self.valueLabel = [[UILabel alloc] init];
    self.serialNumberLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.valueLabel];
    [self.contentView addSubview:self.serialNumberLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.top.left.mas_equalTo(self.contentView).offset(10);
//        make.height.mas_equalTo(@20);
//        make.width.mas_equalTo(@50);
    }];
    
    [self.serialNumberLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.left.mas_equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel).offset(30);
        make.bottom.mas_equalTo(self.contentView).offset(-10);
//        make.height.mas_equalTo(@20);
//        make.width.mas_equalTo(@50);
    }];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.centerY.mas_equalTo(self.contentView);
        make.right.bottom.mas_equalTo(self.contentView).offset(-10);
//        make.height.mas_equalTo(@20);
//        make.width.mas_equalTo(@50);
    }];
    
    [self.serialNumberLabel setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisVertical];
    [self.serialNumberLabel setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisVertical];
    [self.serialNumberLabel setTextColor:[UIColor grayColor]];
    
    self.nameLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.nameLabel.adjustsFontForContentSizeCategory = YES;
    
    self.valueLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.valueLabel.adjustsFontForContentSizeCategory = YES;
    
    self.serialNumberLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    self.serialNumberLabel.adjustsFontForContentSizeCategory = YES;
    
}

@end
