//
//  ViewController.m
//  Demo
//
//  Created by m3 on 2025/5/24.
//
#import "ViewController.h"
#import "CrabNative.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CrabNativeView *crabNativeView = [[CrabNativeView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    
    UITextView *text0 = [crabNativeView createTextWithContent: @"hello"];
    text0.frame = CGRectMake(100, 100, 100, 40);
    
    UITextView *text1 = [crabNativeView createTextWithContent: @"world"];
    text1.frame = CGRectMake(100, 200, 100, 40);
    
    UITextView *text2 = [crabNativeView createTextWithContent: @"🤔"];
    text2.frame = CGRectMake(100, 300, 100, 40);
    
    UITextView *text3 = [crabNativeView createTextWithContent: @"should not be seen"];
    text3.frame = CGRectMake(100, 400, 100, 40);
    
    [self.view addSubview:crabNativeView];
    [crabNativeView addSubview:text0];
    [crabNativeView addSubview:text1];
    [crabNativeView addSubview:text2];
    
    text2.text = @"👻";
    
    [crabNativeView addSubview:text3];
    [text3 removeFromSuperview];
}


@end
