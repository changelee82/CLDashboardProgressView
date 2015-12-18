//
//  CLDashboardProgressLayer.m
//  CLDashboardProgressView
//
//  Created by 李辉 on 15/12/17.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLDashboardProgressView
//

#import "CLDashboardProgressLayer.h"

/** 2π */
static const CGFloat k2Pi = M_PI * 2.0f;



@implementation CLDashboardProgressLayer

/** 初始化方法，用于从代码中创建的类实例 */
- (instancetype)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

/** 初始化方法 */
- (instancetype)initWithLayer:(id)layer
{
    if (self = [super initWithLayer:layer])
    {
        if ([layer isKindOfClass:[CLDashboardProgressLayer class]])
        {
        }
    }
    return self;
}

/**
 *  创建及初始化层
 *
 *  @return 新创建的层
 */
+ (id)layer
{
    CLDashboardProgressLayer *layer = [[CLDashboardProgressLayer alloc] init];
    return layer;
}

// 下列属性改变，则刷新层
/**
 *  指定属性改变时，layer刷新
 *
 *  @param key 属性名
 *
 *  @return 刷新：YES；  不刷新：NO
 */
+ (BOOL)needsDisplayForKey:(NSString *)key
{
    if  (  [key isEqualToString:@"outerRadius"]
        || [key isEqualToString:@"innerRadius"]
        || [key isEqualToString:@"beginAngle"]
        || [key isEqualToString:@"blockAngle"]
        || [key isEqualToString:@"gapAngle"]
        || [key isEqualToString:@"progressColor"]
        || [key isEqualToString:@"trackColor"]
        || [key isEqualToString:@"outlineColor"]
        || [key isEqualToString:@"outlineWidth"]
        || [key isEqualToString:@"blockCount"]
        || [key isEqualToString:@"minValue"]
        || [key isEqualToString:@"maxValue"]
        || [key isEqualToString:@"currentValue"]
        || [key isEqualToString:@"showShadow"]
        || [key isEqualToString:@"shadowOuterRadius"]
        || [key isEqualToString:@"shadowInnerRadius"]
        || [key isEqualToString:@"shadowFillColor"]
        || [key isEqualToString:@"autoAdjustAngle"])
    {
        return YES;
    }
    
    return [super needsDisplayForKey:key];
}


/**
 *  绘制层
 *
 *  @param ctx 设备上下文
 */
- (void)drawInContext:(CGContextRef)ctx
{
    // 自动调整角度
    if (_autoAdjustAngle == YES)
    {
        CGFloat totalAngle = k2Pi - (self.blockAngle+self.gapAngle) * self.blockCount - self.gapAngle;
        _beginAngle = k2Pi * 0.25 + totalAngle * 0.5;
    }
    
    // 根据中点绘制层
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    [self drawProgressionInContext:ctx atCenter:center];
}


/**
 *  绘制进度条
 *
 *  @param ctx    设备上下文
 *  @param center 绘制中心点
 */
- (void)drawProgressionInContext:(CGContextRef)ctx
                        atCenter:(CGPoint)center
{
    // 计算当前进度显示到第几块
    CGFloat total = _maxValue - _minValue;
    CGFloat current = _currentValue - _minValue;
    CGFloat blockValue = total / _blockCount;
    NSUInteger currentBlock = current / blockValue;
    
    // 第一块的起始角度和终止角度
    CGFloat blockBeginAngle = _beginAngle;
    CGFloat blockEndAngle = _beginAngle + _blockAngle;
    
    // 绘制进度块
    BOOL isFill;
    for (NSUInteger i=1; i<=_blockCount; ++i)
    {
        if (i <= currentBlock)
            isFill = YES;
        else
            isFill = NO;
        
        // 绘制块
        [self drawBlockInContext:ctx center:center startAngle:blockBeginAngle endAngle:blockEndAngle isFill:isFill];
        
        // 绘制阴影
        if (_showShadow)
            [self drawBlockShadowInContext:ctx center:center startAngle:blockBeginAngle endAngle:blockEndAngle];
        
        // 下一块的起始角度和终止角度
        blockBeginAngle += _blockAngle + _gapAngle;
        blockEndAngle += _blockAngle + _gapAngle;
    }
}

/**
 *  绘制进度块，按照顺时针绘制
 *
 *  @param ctx        设备上下文
 *  @param center     进度条中心点
 *  @param startAngle 块起始角度
 *  @param endAngle   块终止角度
 *  @param isFill     块是否被填充
 */
- (void)drawBlockInContext:(CGContextRef)ctx
                    center:(CGPoint)center
                startAngle:(CGFloat)startAngle
                  endAngle:(CGFloat)endAngle
                    isFill:(BOOL)isFill
{
    // 绘制扇形
    CGContextAddArc(ctx, center.x, center.y, _outerRadius, startAngle, endAngle, 0);
    CGContextAddArc(ctx, center.x, center.y, _innerRadius, endAngle, startAngle, 1);
    CGContextClosePath(ctx);
    
    UIColor *fillColor;
    if (isFill)
        fillColor = _progressColor;
    else
        fillColor = _trackColor;
    
    // 设置绘制参数
    CGContextSetLineWidth(ctx, _outlineWidth);
    CGContextSetStrokeColorWithColor(ctx, _outlineColor.CGColor);
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    
    // 绘制
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

/**
 *  绘制进度块阴影
 *
 *  @param ctx        设备上下文
 *  @param center     进度条中心点
 *  @param startAngle 块起始角度
 *  @param endAngle   块终止角度
 */
- (void)drawBlockShadowInContext:(CGContextRef)ctx
                          center:(CGPoint)center
                      startAngle:(CGFloat)startAngle
                        endAngle:(CGFloat)endAngle
{
    // 绘制扇形
    CGContextAddArc(ctx, center.x, center.y, _shadowOuterRadius, startAngle, endAngle, 0);
    CGContextAddArc(ctx, center.x, center.y, _shadowInnerRadius, endAngle, startAngle, 1);
    CGContextClosePath(ctx);
    
    
    CGContextSetFillColorWithColor(ctx, _shadowFillColor.CGColor);
    CGContextFillPath(ctx);
}


@end
