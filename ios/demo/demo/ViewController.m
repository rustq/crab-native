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
+ (void)addActiveButton:(int)x y:(int)y width:(int)width height:(int)height;
@end

void say(int x, int y, int width, int height) {
    NSLog(@"HIHIHI");
    [ViewController addActiveButton:x y:y width:width height:height];
}

@implementation ViewController

static UIView *activeView = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController setActiveView: self.view];
    rust_function();
    rust_ffi(say);
    // Do any additional setup after loading the view.
}


+ (UIView *)activeView {
    return activeView;
}

// 设置当前的 activeView
+ (void)setActiveView:(UIView *)view {
    activeView = view;
}

+ (void)addActiveButton:(int)x y:(int)y width:(int)width height:(int)height {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(x, y, width, height);
        [button setTitle:@"I am active" forState:UIControlStateNormal];
        [[ViewController activeView] addSubview:button];
    });
}

@end
