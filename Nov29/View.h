#import <UIKit/UIKit.h>
@class ViewController;

@interface View: UIView{
    ViewController *viewController;
    CGFloat currMin;
    CGFloat rectMin;
    BOOL shrink;
}

- (id) initWithFrame: (CGRect) frame controller: (ViewController *) c;
@end
