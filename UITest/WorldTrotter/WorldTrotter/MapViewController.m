//
//  MapViewController.m
//  WorldTrotter
//
//  Created by zhangchenhua on 2021/5/28.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) loadView
{
    self.mapView = [[MKMapView alloc] init];
    self.view = self.mapView;
    
    NSArray *items = @[@"Standard", @"Hybrid", @"Satellite"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    segmentedControl.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    segmentedControl.selectedSegmentIndex = 0;
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:segmentedControl];
    
    [segmentedControl.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:8].active = YES;
    [segmentedControl.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor].active = YES;
    [segmentedControl.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor].active =YES;
    
    [segmentedControl addTarget:self action:@selector(mapTypeChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void) mapTypeChanged: (UISegmentedControl *) segControl
{
    switch (segControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        default:
            break;
    }
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
