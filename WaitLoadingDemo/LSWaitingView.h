//
 
//

#import <UIKit/UIKit.h>

@interface LSWaitingView : UIView {
	UIActivityIndicatorView *_indicatorView;
	UILabel					*_loadingLabel;
}

- (id)initWithCenterLocation:(CGPoint)center;
- (void)setTitle:(NSString *)title;
- (void)startAnimation;
- (void)stopAnimation;

@end
