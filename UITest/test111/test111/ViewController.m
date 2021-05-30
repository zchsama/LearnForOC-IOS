//
//  ViewController.m
//  test111
//
//  Created by zhangchenhua on 2021/5/30.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()
@property (nonatomic, strong) UIButton *myButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    self.myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.myButton setTitle:@"Tap me!" forState:UIControlStateNormal];
    [self.myButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.myButton.backgroundColor = [UIColor grayColor];
    //self.myButton.frame = CGRectMake(0, 0, 200, 200);
    [self.view addSubview:self.myButton];
    [self.myButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view).offset(50);
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(@150);
    }];
    
    self.view.userInteractionEnabled = YES;
    self.myButton.userInteractionEnabled = YES;
    
    [self.view layoutIfNeeded];
    
    NSLog(@"father frame %@", NSStringFromCGRect(self.view.frame));
    NSLog(@"button frame %@", NSStringFromCGRect(self.myButton.frame));
    
    [self.myButton
        addTarget:self
        action:@selector(buttonTapped:)
        forControlEvents:UIControlEventTouchDown];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap111)];
//    [self.view addGestureRecognizer:tap];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    
}


- (void) buttonTapped: (UIButton *)btn{
    NSLog(@"tap");
}


@end
