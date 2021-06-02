//
//  ViewController.m
//  TouchTracker
//
//  Created by zhangchenhua on 2021/6/2.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) loadView
{
    self.view = [[DrawView alloc] initWithFrame:CGRectZero];
}

@end
