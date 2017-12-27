//
 
//

#import "LSWaitingView.h"


#define LSRGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@implementation LSWaitingView

- (id)initWithCenterLocation:(CGPoint)center {
	CGRect frame = CGRectMake(0, 0, 80, 80);
	frame.origin.x = center.x - 40;
	frame.origin.y = center.y - 40;
	
	return [self initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        
		_indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		_indicatorView.frame = CGRectMake(25, 10, 30, 30);
		_indicatorView.hidesWhenStopped = YES;
		[self addSubview:_indicatorView];
		
		_loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 70, 20)];
		_loadingLabel.backgroundColor = [UIColor clearColor];
		[_loadingLabel setTextAlignment:NSTextAlignmentCenter];
		
		_loadingLabel.font = [UIFont boldSystemFontOfSize:15.0f];
		_loadingLabel.textColor = [UIColor whiteColor];
		[self addSubview:_loadingLabel];
		
		self.backgroundColor = [UIColor clearColor];
		self.hidden = YES;
	}
    return self;
}

- (void)setTitle:(NSString *)title {
	_loadingLabel.text = title;
}

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
    CGRect rrect = self.bounds;
    
    CGFloat radius = 8.0f;
    CGFloat width = CGRectGetWidth(rrect);
    CGFloat height = CGRectGetHeight(rrect);
    
    // Make sure corner radius isn't larger than half the shorter side
    if (radius > width/2.0)
        radius = width/2.0;
    if (radius > height/2.0)
        radius = height/2.0;
    
    CGFloat minx = CGRectGetMinX(rrect);
    CGFloat midx = CGRectGetMidX(rrect);
    CGFloat maxx = CGRectGetMaxX(rrect);
    CGFloat miny = CGRectGetMinY(rrect);
    CGFloat midy = CGRectGetMidY(rrect);
    CGFloat maxy = CGRectGetMaxY(rrect);
	
	CGContextSetFillColorWithColor(context,[LSRGBA(0,0,0,0.8) CGColor]);
	
	CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
	CGContextDrawPath(context, kCGPathFill);
}

- (void)dealloc {
    
    UIView *redv=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    redv.backgroundColor=[UIColor redColor];
    [self addSubview:redv];
    redv.layer.borderWidth=1;
    redv.layer.borderColor=[UIColor redColor].CGColor;
    
}

- (void)startAnimation {
	self.hidden = NO;
	[_indicatorView startAnimating];
}

- (void)stopAnimation {
	self.hidden = YES;
	[_indicatorView stopAnimating];
}


@end
