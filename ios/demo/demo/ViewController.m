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
+ (int)create_button;
+ (UIButton*)get_button:(int)id;
+ (void)set_button_text:(int)id text:(const char*)text;
+ (void)add_button_to_view:(int)id;
+ (void)set_button_x_y_w_h:(int)id x:(int)x y:(int)y w:(int)w h:(int)h;
+ (void)remove_button:(int)id;
+ (void)init_button_pool;
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

void init_button_pool() {
    [ViewController init_button_pool];
}

int create_button() {
    return [ViewController create_button];
}

void set_button_text(int id, const char* text) {
    [ViewController set_button_text:id text:text];
}

void add_button_to_view(int id) {
    [ViewController add_button_to_view:id];
}

void set_button_x_y_w_h(int id, int x, int y, int w, int h) {
    [ViewController set_button_x_y_w_h:id x:x y:y w:w h:h];
}

void remove_button(int id) {
    [ViewController remove_button:id];
}

@implementation ViewController

static UIView *activeView = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController setActiveView: self.view];
    rust_function();
//    rust_ffi(addUI);
    button_ffi(init_button_pool, create_button, set_button_text, add_button_to_view, set_button_x_y_w_h, remove_button);

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 500, 100, 100);
    [button setTitle:@"remove 1" forState:UIControlStateNormal];
    [[ViewController activeView] addSubview:button];
    UIAction *action = [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        NSLog(@"Button clicked (inline UIAction)!");
        remove_button(1);
    }];
    [button addAction:action forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(0, 600, 100, 100);
    [button1 setTitle:@"update 1" forState:UIControlStateNormal];
    [[ViewController activeView] addSubview:button1];
    UIAction *action1 = [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        NSLog(@"Button clicked (inline UIAction)!");
        set_button_x_y_w_h(1, 100, 250, 100, 100);
    }];
    [button1 addAction:action1 forControlEvents:UIControlEventTouchUpInside];
    

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(140, 500, 100, 100);
    [button2 setTitle:@"remove 2" forState:UIControlStateNormal];
    [[ViewController activeView] addSubview:button2];
    UIAction *action2 = [UIAction actionWithHandler:^(__kindof UIAction * _Nonnull action) {
        NSLog(@"Button clicked (inline UIAction)!");
        remove_button(2);
    }];
    [button2 addAction:action2 forControlEvents:UIControlEventTouchUpInside];
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

static NSMutableDictionary<NSNumber*, UIButton*>* buttonPool;
static int currentButtonID = 1;

+ (int)create_button {
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    int id = currentButtonID++;
    buttonPool[@(id)] = btn;
    return id;
}

+ (void)set_button_text:(int)id text:(const char*)text {
    UIButton* btn = buttonPool[@(id)];
    NSString* nsText = [NSString stringWithUTF8String:text];
    [btn setTitle:nsText forState:UIControlStateNormal];
}

+ (void)set_button_x_y_w_h:(int)id x:(int)x y:(int)y w:(int)w h:(int)h {
    UIButton* btn = buttonPool[@(id)];
    [btn setFrame:CGRectMake(x, y, w, h)];
}

+ (void)add_button_to_view:(int)id {
    UIButton* btn = buttonPool[@(id)];
    [[ViewController activeView] addSubview:btn];
}

+ (void)remove_button:(int)id {
    UIButton* btn = buttonPool[@(id)];
    [btn removeFromSuperview];
    [buttonPool removeObjectForKey:@(id)];
}

+ (void)init_button_pool {
    buttonPool = [NSMutableDictionary dictionary];
}


@end
