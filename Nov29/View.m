#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame controller:(ViewController *)c
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        viewController = c;
        currMin = 1;
        rectMin = 0.9;
        shrink = true;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect {
   	CGSize size = self.bounds.size;
    CGFloat min = MIN(size.width, size.height);
	CGFloat longSide = min * 1.1;
	CGFloat shortSide = longSide / 3;
    CGRect  bounds = self.bounds;
    CGFloat radius = .3 * bounds.size.width;
    
    CGRect r = CGRectMake(
                          bounds.origin.x + bounds.size.width / 2 - radius,
                          bounds.origin.y + bounds.size.height / 2 - radius,
                          2 * radius,
                          2 * radius
                          );
    
    CGRect r1 = CGRectMake(-shortSide/2 ,-longSide/2, longSide/3+shortSide, longSide/3+shortSide);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextBeginPath(c); //unnecessary here: the path is already empty.
    if(shrink && currMin <= 0.1){
        shrink = false;
    }
    else if(!shrink && currMin >= 1){
        shrink = true;
    }
    
    if(shrink){
        currMin *= 0.9;
        
    }
    else {
        currMin*=1.1;
    }
    
    
    CGAffineTransform scale = CGAffineTransformMakeScale(currMin, currMin);
    CGContextConcatCTM(c, scale);
    CGContextAddEllipseInRect(c, r);
    CGContextSetRGBFillColor(c, 0.0, 0.0, 1.0, 0.1+currMin);	//red, opaque
    CGContextFillPath(c);
    CGContextSetShadow(c, CGSizeMake(10, -20), 2);
    // [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 0.08];
    CGContextBeginPath(c);
    CGContextTranslateCTM(c, size.width / 2, size.height / 2); //origin at center of view
    CGContextScaleCTM(c, 1, -1);
    CGContextRotateCTM(c, -15.0 * M_PI*currMin*40/ 180.0);
    CGAffineTransform scaleRect = CGAffineTransformMakeScale(currMin, currMin);
    CGContextConcatCTM(c, scaleRect);
    CGContextAddRect(c,r1);
    CGContextSetRGBFillColor(c, 1.0, 0.0, 0.0, 1.0);
    CGContextFillPath(c);
    [self performSelector: @selector(setNeedsDisplay) withObject: nil afterDelay: 0.08];
    
    
}

@end
