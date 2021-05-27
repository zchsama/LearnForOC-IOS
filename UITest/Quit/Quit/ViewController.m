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
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
    
}

@end
