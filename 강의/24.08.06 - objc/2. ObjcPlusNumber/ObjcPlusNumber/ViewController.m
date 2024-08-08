//
//  ViewController.m
//  ObjcPlusNumber
//
//  Created by 김종혁 on 8/6/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

// count 변수 선언 ( 포인터 )
@property NSNumber *count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // count에다가 0을 할당
    self.count = [NSNumber numberWithInt: 0];
    
    // updateLabel 호출
    [self updateLabel];
}

- (void)updateLabel {
    // value에다가 정수형 count값을 할당
    int value = [self.count intValue];
    
    // value를 문자열로 변환하여 text에 할당
    NSString *text = [[NSString alloc] initWithFormat:@"%d", value];
    
    // IBOutlet numberLabel을 text로 셋팅
    [self.numberLabel setText:text];
}

- (IBAction)plusOne:(id)sender {
    int value = [self.count intValue];
    value += 1;
    self.count = [NSNumber numberWithInt: value];
    
    [self updateLabel];
}

- (IBAction)plusFive:(id)sender {
    int value = [self.count intValue];
    value += 5;
    self.count = [NSNumber numberWithInt: value];
    [self updateLabel];
}

- (IBAction)plusTen:(id)sender {
    int value = [self.count intValue];
    value += 10;
    self.count = [NSNumber numberWithInt: value];
    [self updateLabel];
}

- (IBAction)resetBtn:(id)sender {
    int value = [self.count intValue];
    value = 0;
    self.count = [NSNumber numberWithInt: value];
    [self updateLabel];
}





@end
