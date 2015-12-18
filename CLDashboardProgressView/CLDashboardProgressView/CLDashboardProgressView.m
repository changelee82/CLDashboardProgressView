//
//  CLDashboardProgressView.m
//  CLDashboardProgressView
//
//  Created by 李辉 on 15/12/17.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLDashboardProgressView
//

#import "CLDashboardProgressView.h"
#import "CLDashboardProgressLayer.h"


#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)  // 角度转弧度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))    // 弧度转角度



@implementation CLDashboardProgressView

#pragma mark - 初始化

/** 初始化方法，用于从代码中创建的类实例 */
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

/** 初始化方法，用于从代码中创建的类实例 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

/** 初始化方法，用于从xib文件中载入的类实例 */
- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

/** 默认的初始化方法 */
- (void)defaultInit
{
    CGFloat minRadius = MIN(self.bounds.size.width, self.bounds.size.height);
    
    self.outerRadius = MIN(minRadius, 221) / 2;
    self.innerRadius = MAX(self.outerRadius - 12, 0);
    self.beginAngle = 145;
    self.blockAngle = 8;
    self.gapAngle = 2;
    self.progressColor = [UIColor greenColor];
    self.trackColor = [UIColor grayColor];
    self.outlineColor = [UIColor clearColor];
    self.outlineWidth = 0;
    
    self.blockCount = 26;
    self.minValue = 0;
    self.maxValue = 100;
    self.currentValue = 50;
    
    self.showShadow = NO;
    self.shadowOuterRadius = MAX(self.innerRadius-5, 0);
    self.shadowInnerRadius = 10;
    self.shadowFillColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    
    self.autoAdjustAngle = YES;    
}

// 重设默认层
+ (Class)layerClass
{
    return [CLDashboardProgressLayer class];
}

// 重新布局视图
- (void)layoutSubviews
{
    CLDashboardProgressLayer *layer = (CLDashboardProgressLayer *)self.layer;
    [layer setNeedsDisplay];
}



#pragma mark - 属性

- (CGFloat)outerRadius
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.outerRadius;
}

- (void)setOuterRadius:(CGFloat)outerRadius
{
    if (self.outerRadius != outerRadius)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.outerRadius = outerRadius;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)innerRadius
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.innerRadius;
}

- (void)setInnerRadius:(CGFloat)innerRadius
{
    if (self.innerRadius != innerRadius)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.innerRadius = innerRadius;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)beginAngle
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return RADIANS_TO_DEGREES(layer.beginAngle);
}

- (void)setBeginAngle:(CGFloat)beginAngle
{
    CGFloat radians = DEGREES_TO_RADIANS(beginAngle);
    if (self.beginAngle != radians)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.beginAngle = radians;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)blockAngle
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return RADIANS_TO_DEGREES(layer.blockAngle);
}

- (void)setBlockAngle:(CGFloat)blockAngle
{
    CGFloat radians = DEGREES_TO_RADIANS(blockAngle);
    if (self.blockAngle != blockAngle)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.blockAngle = radians;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)gapAngle
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return RADIANS_TO_DEGREES(layer.gapAngle);
}

- (void)setGapAngle:(CGFloat)gapAngle
{
    CGFloat radians = DEGREES_TO_RADIANS(gapAngle);
    if (self.gapAngle != radians)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.gapAngle = radians;
        [layer setNeedsDisplay];
    }
}

- (UIColor *)progressColor
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.progressColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    if (![self.progressColor isEqual:progressColor])
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.progressColor = progressColor;
        [layer setNeedsDisplay];
    }
}

- (UIColor *)trackColor
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.trackColor;
}

- (void)setTrackColor:(UIColor *)trackColor
{
    if (![self.trackColor isEqual:trackColor])
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.trackColor = trackColor;
        [layer setNeedsDisplay];
    }
}

- (UIColor *)outlineColor
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.outlineColor;
}

- (void)setOutlineColor:(UIColor *)outlineColor
{
    if (![self.outlineColor isEqual:outlineColor])
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.outlineColor = outlineColor;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)outlineWidth
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.outlineWidth;
}

- (void)setOutlineWidth:(CGFloat)outlineWidth
{
    if (self.outlineWidth != outlineWidth)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.outlineWidth = outlineWidth;
        [layer setNeedsDisplay];
    }
}

- (NSUInteger)blockCount
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.blockCount;
}

- (void)setBlockCount:(NSUInteger)blockCount
{
    if (self.blockCount != blockCount)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.blockCount = blockCount;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)minValue
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.minValue;
}

- (void)setMinValue:(CGFloat)minValue
{
    if (self.minValue != minValue)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.minValue = minValue;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)maxValue
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.maxValue;
}

- (void)setMaxValue:(CGFloat)maxValue
{
    if (self.maxValue != maxValue)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.maxValue = maxValue;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)currentValue
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.currentValue;
}

- (void)setCurrentValue:(CGFloat)currentValue
{
    if (self.currentValue != currentValue)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.currentValue = currentValue;
        [layer setNeedsDisplay];
    }
}

- (BOOL)showShadow
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.showShadow;
}

- (void)setShowShadow:(BOOL)showShadow
{
    if (self.showShadow != showShadow)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.showShadow = showShadow;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)shadowOuterRadius
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.shadowOuterRadius;
}

- (void)setShadowOuterRadius:(CGFloat)shadowOuterRadius
{
    if (self.shadowOuterRadius != shadowOuterRadius)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.shadowOuterRadius = shadowOuterRadius;
        [layer setNeedsDisplay];
    }
}

- (CGFloat)shadowInnerRadius
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.shadowInnerRadius;
}

- (void)setShadowInnerRadius:(CGFloat)shadowInnerRadius
{
    if (self.shadowInnerRadius != shadowInnerRadius)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.shadowInnerRadius = shadowInnerRadius;
        [layer setNeedsDisplay];
    }
}

- (UIColor *)shadowFillColor
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.shadowFillColor;
}

- (void)setShadowFillColor:(UIColor *)shadowFillColor
{
    if (![self.shadowFillColor isEqual:shadowFillColor])
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.shadowFillColor = shadowFillColor;
        [layer setNeedsDisplay];
    }
}

- (BOOL)autoAdjustAngle
{
    CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
    
    return layer.autoAdjustAngle;
}

- (void)setAutoAdjustAngle:(BOOL)autoAdjustAngle
{
    if (self.autoAdjustAngle != autoAdjustAngle)
    {
        CLDashboardProgressView *layer = (CLDashboardProgressView *)self.layer;
        layer.autoAdjustAngle = autoAdjustAngle;
        [layer setNeedsDisplay];
    }
}

@end
