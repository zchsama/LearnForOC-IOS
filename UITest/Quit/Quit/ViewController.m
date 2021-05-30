//
//  ViewController.m
//  Quit
//
//  Created by zhangchenhua on 2021/5/26.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic) int currentQuestionIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questions = @[@"From what is cognac made?", @"What is 7+7?", @"What is the captital of Vermont?"];
    self.answers = @[@"Grapes",@"14",@"Montpelier"];
    
}

- (IBAction)showNextQuestion:(id)sender
{
    self.currentQuestionIndex++;
    if(self.currentQuestionIndex == (int)self.questions.count){
        self.currentQuestionIndex = 0;
    }
    NSString *question = self.questions[self.currentQuestionIndex];
    self.nextQuestionLabel.text = question;
    self.answerLabel.text = @"? ? ?";
    
    [self animatelabelTransactions];
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
    
}

- (void) animatelabelTransactions
{
    void (^animationBlock) (void) = ^{
        self.currentQuestionLabel.alpha = 0;
        self.nextQuestionLabel.alpha = 1;
    };
    
    void (^completionBlock) (UIViewAnimatingPosition) = ^(UIViewAnimatingPosition finalPositon){
        UILabel *temp = self.currentQuestionLabel;
        self.currentQuestionLabel = self.nextQuestionLabel;
        self.nextQuestionLabel = temp;
    };
    
    //UIViewPropertyAnimator *animator = [[UIViewPropertyAnimator alloc] initWithDuration:0.5 curve:UIViewAnimationCurveEaseInOut animations:animationBlock];
    
     [UIViewPropertyAnimator runningPropertyAnimatorWithDuration:0.5 delay:0 options:nil animations:animationBlock completion:completionBlock];
    //[animator startAnimation];
    
}

- (void) viewWillAppear:(BOOL)animated
{
    self.nextQuestionLabel.alpha = 0;
}

@end
