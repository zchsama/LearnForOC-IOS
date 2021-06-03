//
//  PhotosViewController.m
//  Photorama
//
//  Created by zhangchenhua on 2021/6/2.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.store fetchInterestingPhotos];
    self.view.backgroundColor = [UIColor whiteColor];
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
