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
    UIView *crabNativeView = [CrabNative createViewWithFrame:CGRectMake(50, 50, 200, 200)];
    
    [self.view addSubview:crabNativeView];
}


@end
