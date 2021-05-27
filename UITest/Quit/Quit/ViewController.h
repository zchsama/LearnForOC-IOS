//
//  ViewController.h
//  Quit
//
//  Created by zhangchenhua on 2021/5/26.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

- (IBAction) showNextQuestion:(id)sender;
- (IBAction) showAnswer:(id)sender;



@end

