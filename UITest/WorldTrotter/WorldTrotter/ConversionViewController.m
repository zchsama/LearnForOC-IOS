//
//  ConversionViewController.m
//  WorldTrotter
//
//  Created by zhangchenhua on 2021/5/27.
//

#import "ConversionViewController.h"

@interface ConversionViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UILabel *celsiusLabel;
@property (nonatomic, copy) NSMeasurement *fahrenHeitValues;
@property (nonatomic, copy) NSMeasurement *celsiusValue;

@end

@implementation ConversionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateCeisiusLabel];
    [self addObserver];
}

- (IBAction)fahrenHeiFieldEditingChanged:(UITextField *) testField
{
    NSNumberFormatter *value = [[NSNumberFormatter alloc] init];
    //NSLog(@"value init" );
    if(testField.text.length != 0 && ([value numberFromString:testField.text]))
    {
        //NSLog(@"correct input");
        self.fahrenHeitValues = [[NSMeasurement alloc] initWithDoubleValue:[testField.text doubleValue]  unit:NSUnitTemperature.fahrenheit];
        //[self updateCeisiusLabel];
    }
    else{
        self.fahrenHeitValues = nil;
        //[self updateCeisiusLabel];
        //NSLog(@"false input");
    }
}

- (void) convertToCelsiusValue
{
    //NSLog(@"enter convertFunc");
    if(self.fahrenHeitValues)
    {
        self.celsiusValue = [self.fahrenHeitValues measurementByConvertingToUnit:NSUnitTemperature.celsius];
        //NSLog(@"fahrenHeitVAlues not null: %@", self.celsiusValue);
    }
    else{
        self.celsiusValue =  nil;
        //NSLog(@"f is null: %@", self.fahrenHeitValues);
    }
}

- (void) updateCeisiusLabel
{
    [self convertToCelsiusValue];
    //NSLog(@"after convert: %@", self.celsiusValue);
    if(self.celsiusValue){
        NSString *celsiusText = [NSString stringWithFormat:@"%.2f",self.celsiusValue.doubleValue];
        //NSLog(@"new text： %@", celsiusText);
        self.celsiusLabel.text = celsiusText;
    }
    else{
        self.celsiusLabel.text = @"???";
        //NSLog(@"not update： %@", self.celsiusValue);
    }
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //NSLog(@"current text: %@", textField.text);
    //NSLog(@"replace: %@", string);
    
    return true;
}

- (void) addObserver{
    NSKeyValueObservingOptions option = NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew;

    [self addObserver:self forKeyPath:@"fahrenHeitValues" options:option context:@"f change"];
}
//
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    [self updateCeisiusLabel];
    //NSLog(@"%s---监听到%@的%@属性值改变了 - %@ - %@", __func__, object, keyPath, change, context);
}
//
//- (void)dealloc
//{
//    [self removeObserver];
//}
//
//- (void) removeObserver
//{
//    [self.fahrenHeitValues removeObserver:self forKeyPath:@"fahrenHeitValues"];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
