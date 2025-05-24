//
//  CrabNative.m
//  CrabNative
//
//  Created by m3 on 2025/5/24.
//

#import "CrabNative.h"

@implementation CrabNativeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (UITextView *)createTextWithContent:(NSString *)content {
    UITextView *textView = [[UITextView alloc] init];
    textView.text = content;
    return textView;
}

@end
