//
//  CLDashboardProgressLayer.h
//  CLDashboardProgressView
//
//  Created by 李辉 on 15/12/17.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLDashboardProgressView
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>


/** 仪表盘进度条层 */
@interface CLDashboardProgressLayer : CALayer

@property (nonatomic, assign) CGFloat  outerRadius;    // 外圈半径
@property (nonatomic, assign) CGFloat  innerRadius;    // 内圈半径
@property (nonatomic, assign) CGFloat  beginAngle;     // 起始角度
@property (nonatomic, assign) CGFloat  blockAngle;     // 每个进度块的角度
@property (nonatomic, assign) CGFloat  gapAngle;       // 两个进度块的间隙的角度
@property (nonatomic, strong) UIColor *progressColor;  // 进度条填充色
@property (nonatomic, strong) UIColor *trackColor;     // 进度条痕迹填充色
@property (nonatomic, strong) UIColor *outlineColor;   // 进度条边框颜色
@property (nonatomic, assign) CGFloat  outlineWidth;   // 进度条边框线宽

@property (nonatomic, assign) NSUInteger blockCount;   // 进度块的数量
@property (nonatomic, assign) CGFloat    minValue;     // 进度条最小数值
@property (nonatomic, assign) CGFloat    maxValue;     // 进度条最大数值
@property (nonatomic, assign) CGFloat    currentValue; // 进度条当前数值

@property (nonatomic, assign) BOOL     showShadow;        // 是否显示阴影
@property (nonatomic, assign) CGFloat  shadowOuterRadius; // 阴影外圈半径
@property (nonatomic, assign) CGFloat  shadowInnerRadius; // 阴影内圈半径
@property (nonatomic, strong) UIColor *shadowFillColor;   // 阴影颜色

/** 自动调整角度，使进度条开口向下并且左右对称，默认为NO */
@property (nonatomic, assign) BOOL     autoAdjustAngle;


@end
