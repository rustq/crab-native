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
+ (void)addActiveLabel:(int)x y:(int)y width:(int)width height:(int)height;
@end

void addUI(int type, int x, int y, int width, int height) {
    switch (type) {
        case 0:
            [ViewController addActiveButton:x y:y width:width height:height];
            break;
        case 1:
            [ViewController addActiveLabel:x y:y width:width height:height];
            break;
        default:
            break;
    }
}

@implementation ViewController

static UIView *activeView = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController setActiveView: self.view];
    rust_function();
    rust_ffi(addUI);
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

+ (void)addActiveLabel:(int)x y:(int)y width:(int)width height:(int)height {
    dispatch_async(dispatch_get_main_queue(), ^{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
        label.text = @"Hi";
        [[ViewController activeView] addSubview:label];
    });
}

@end
