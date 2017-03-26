//
//  ViewController.m
//  NEMRefresh
//
//  Created by dirtmelon on 17/3/26.
//  Copyright © 2017年 dirtmelon. All rights reserved.
//

#import "ViewController.h"
#define DEGREES_TO_RADOANS(x) (M_PI * (x) / 180.0)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *refreshView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	CAShapeLayer *redLayer = [self colorLayerWithStartAngle:-40 endAngle:40 color:[UIColor redColor]];
	[_refreshView.layer addSublayer:redLayer];
	
	CAShapeLayer *blueLayer = [self colorLayerWithStartAngle:80 endAngle:160 color:[UIColor blueColor]];
	[_refreshView.layer addSublayer:blueLayer];

	CAShapeLayer *yellowLayer = [self colorLayerWithStartAngle:200 endAngle:280 color:[UIColor yellowColor]];
	[_refreshView.layer addSublayer:yellowLayer];
	
	CABasicAnimation *circleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	circleAnimation.duration = 2.5f;
	circleAnimation.toValue = @(M_PI * 2);
	circleAnimation.removedOnCompletion = NO;
	circleAnimation.fillMode = kCAFillModeForwards;
	circleAnimation.repeatCount = HUGE_VALF;
	
	CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaleAnimation.fromValue = @(0.5);
	scaleAnimation.toValue = @(1);
	scaleAnimation.duration = 2.5f;
	scaleAnimation.repeatCount = HUGE_VALF;
	scaleAnimation.autoreverses = YES;
	
	[_refreshView.layer addAnimation:circleAnimation forKey:nil];
	[_refreshView.layer addAnimation:scaleAnimation forKey:nil];
	
}

- (CAShapeLayer *)colorLayerWithStartAngle: (int)startAngle
								  endAngle: (int)endAngle
									 color: (UIColor *)color
{
	CGRect rect = _refreshView.bounds;
	CAShapeLayer *shapeLayer = [CAShapeLayer layer];
	UIBezierPath *path =  [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
														 radius:rect.size.width / 2.5
													 startAngle: DEGREES_TO_RADOANS(startAngle)
													   endAngle: DEGREES_TO_RADOANS(endAngle)
													  clockwise:YES];
	shapeLayer.lineWidth = 20;
	shapeLayer.path = path.CGPath;
	shapeLayer.fillColor = [UIColor clearColor].CGColor;
	shapeLayer.strokeColor = color.CGColor;
	shapeLayer.lineCap = kCALineCapRound;
	return shapeLayer;
}

@end
