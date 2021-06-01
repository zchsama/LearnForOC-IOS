//
//  ItemViewController.m
//  Homepwner
//
//  Created by zhangchenhua on 2021/5/31.
//

#import "ItemViewController.h"
#import <Masonry/Masonry.h>

@interface ItemViewController ()

@property (nonatomic, strong) UIStackView *itemStackView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *serialNumberLabel;
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *dateCreatedLabel;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *serialNumberTextField;
@property (nonatomic, strong) UITextField *valueTextField;

//- (NSString *) numberFormatter: (void(^)(int))itemDollars;

@end

@implementation ItemViewController

- (instancetype) init{
    self = [super init];
    if(self)
    {
        self.item = [[Item alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.itemStackView = [[UIStackView alloc] init];
    [self.itemStackView setSpacing:10];
    [self.itemStackView setAxis:UILayoutConstraintAxisVertical];
    self.itemStackView.distribution = UIStackViewDistributionFill;
    self.itemStackView.alignment = UIStackViewAlignmentFill;
    [self.view addSubview:self.itemStackView];
    
    [self.itemStackView mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.top.mas_equalTo(self.view.mas_top).offset(8);
        make.left.mas_equalTo(self.view.mas_left).offset(8);
        make.right.mas_equalTo(self.view.mas_right).offset(-8);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-8);
    }];
    
    [self setChildStackView];
    [self setLabelUI];
    [self.itemStackView setNeedsLayout];
    [self.itemStackView layoutIfNeeded];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    NSNumber *number = [NSNumber numberWithInt:self.item.valueInDollars];
    
    numberFormatter.minimumFractionDigits = 2;
    numberFormatter.maximumFractionDigits = 2;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    [self.nameTextField setText:self.item.name];
    [self.valueTextField setText:[numberFormatter stringFromNumber:number]];
    [self.serialNumberTextField setText:self.item.serialNumber];
    [self.dateCreatedLabel setText:[dateFormatter stringFromDate:self.item.dateCreate]];
    
    [self.navigationItem setTitle:self.item.name];
}

- (void) setChildStackView
{
    UIStackView *nameStackView = [[UIStackView alloc] init];
    nameStackView.spacing = 8;
    nameStackView.axis = UILayoutConstraintAxisHorizontal;
    nameStackView.alignment = UIStackViewAlignmentFill;
    nameStackView.distribution = UIStackViewDistributionFill;
    
    self.nameLabel = [[UILabel alloc] init];
    [self.nameLabel setText:@"Name"];
    [nameStackView addArrangedSubview:self.nameLabel];
    
    self.nameTextField = [[UITextField alloc] init];
    [self.nameTextField setBackgroundColor:UIColor.whiteColor];
    [self.nameTextField setBorderStyle:UITextBorderStyleLine];
    [self.nameTextField setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    [nameStackView addArrangedSubview:self.nameTextField];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(@120);
    }];
    
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make)
     {
        make.height.mas_equalTo(@50);
    }];
    
    [self.itemStackView addArrangedSubview:nameStackView];
    
    UIStackView *serialNumberStackView = [[UIStackView alloc] init];
    serialNumberStackView.spacing = 8;
    serialNumberStackView.axis = UILayoutConstraintAxisHorizontal;
    serialNumberStackView.alignment = UIStackViewAlignmentFill;
    serialNumberStackView.distribution = UIStackViewDistributionFill;
    
    self.serialNumberLabel = [[UILabel alloc] init];
    [self.serialNumberLabel setText:@"SerialNumber"];
    [serialNumberStackView addArrangedSubview:self.serialNumberLabel];
    
    self.serialNumberTextField = [[UITextField alloc] init];
    [self.serialNumberTextField setBackgroundColor:UIColor.whiteColor];
    [self.serialNumberTextField setBorderStyle:UITextBorderStyleLine];
    [serialNumberStackView addArrangedSubview:self.serialNumberTextField];
    [self.serialNumberTextField setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.serialNumberLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(@120);
    }];
    
    [self.serialNumberTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(@50);
        
    }];
    
    [self.itemStackView addArrangedSubview:serialNumberStackView];
    
    UIStackView *valueStackView = [[UIStackView alloc] init];
    valueStackView.spacing = 8;
    valueStackView.axis = UILayoutConstraintAxisHorizontal;
    valueStackView.alignment = UIStackViewAlignmentFill;
    valueStackView.distribution = UIStackViewDistributionFill;
    
    self.valueLabel = [[UILabel alloc] init];
    [self.valueLabel setText:@"Value"];
    [valueStackView addArrangedSubview:self.valueLabel];
    
    self.valueTextField = [[UITextField alloc] init];
    [self.valueTextField setBackgroundColor:UIColor.whiteColor];
    [self.valueTextField setBorderStyle:UITextBorderStyleLine];
    [valueStackView addArrangedSubview:self.valueTextField];
    [self.valueTextField setContentCompressionResistancePriority:749 forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.valueLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(@120);
    }];
    
    [self.valueTextField mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.mas_equalTo(@50);
    }];
    
    [self.itemStackView addArrangedSubview:valueStackView];
}

- (void) setLabelUI
{
    self.dateCreatedLabel = [[UILabel alloc] init];
    [self.itemStackView addArrangedSubview:self.dateCreatedLabel];
    [self.dateCreatedLabel setContentHuggingPriority:249 forAxis:UILayoutConstraintAxisVertical];
    [self.dateCreatedLabel setText:@"Date Created"];
    [self.dateCreatedLabel setTextAlignment:NSTextAlignmentCenter];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
