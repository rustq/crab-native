//
//  ViewController.m
//  demo
//
//  Created by m3 on 2025/5/3.
//

#import "ViewController.h"
#import "crab_native.h"

@interface ViewController ()
+ (UIView *)activeView;
+ (void)addActiveButton;
@end

void say() {
    [ViewController addActiveButton];
}

@implementation ViewController

static UIView *activeView = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController setActiveView: self.view];
    rust_function();
    rust_ffi(say);
    [self addButton];
    // Do any additional setup after loading the view.
}


+ (UIView *)activeView {
    return activeView;
}

// 设置当前的 activeView
+ (void)setActiveView:(UIView *)view {
    activeView = view;
}

+ (void)addActiveButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 150, 50);
    [button setTitle:@"I am active" forState:UIControlStateNormal];
    [[ViewController activeView] addSubview:button];
}

- (void)addButton {
    // 创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 150, 50); // 设置位置和大小
    [button setTitle:@"点击我" forState:UIControlStateNormal];
    [self.view addSubview:button];
}


@end
