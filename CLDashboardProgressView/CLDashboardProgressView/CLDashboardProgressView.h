//
//  CLDashboardProgressView.h
//  CLDashboardProgressView
//
//  Created by 李辉 on 15/12/17.
//  Copyright © 2015年 李辉. All rights reserved.
//  https://github.com/changelee82/CLDashboardProgressView
//

#import <UIKit/UIKit.h>


/** 仪表盘进度条视图 */
@interface CLDashboardProgressView : UIView

/** 外圈半径，默认为视图短边边长的一半 */
@property (nonatomic, assign) CGFloat  outerRadius;
/** 内圈半径，默认为（外圈半径-12） */
@property (nonatomic, assign) CGFloat  innerRadius;

/** 起始角度，单位是角度，3点钟方向为0度，顺时针旋转，默认值145度 */
@property (nonatomic, assign) CGFloat  beginAngle;
/** 每个进度块的角度范围，单位是角度，默认值8度 */
@property (nonatomic, assign) CGFloat  blockAngle;
/** 两个进度块的间隙的角度，单位是角度，默认值2度 */
@property (nonatomic, assign) CGFloat  gapAngle;

/** 进度条填充色，默认为绿色 */
@property (nonatomic, strong) UIColor *progressColor;
/** 进度条痕迹填充色，默认为灰色 */
@property (nonatomic, strong) UIColor *trackColor;
/** 进度条边框颜色，默认为无色 */
@property (nonatomic, strong) UIColor *outlineColor;
/** 进度条边框线宽，默认为0 */
@property (nonatomic, assign) CGFloat  outlineWidth;

/** 进度块的数量，默认为26 */
@property (nonatomic, assign) NSUInteger blockCount;
/** 进度条最小数值，默认为0 */
@property (nonatomic, assign) CGFloat    minValue;
/** 进度条最大数值，默认为100 */
@property (nonatomic, assign) CGFloat    maxValue;
/** 进度条当前数值 */
@property (nonatomic, assign) CGFloat    currentValue;

/** 是否显示阴影，默认为NO */
@property (nonatomic, assign) BOOL     showShadow;
/** 阴影外圈半径，默认为（内圈半径-5），最小值为0 */
@property (nonatomic, assign) CGFloat  shadowOuterRadius;
/** 阴影内圈半径，默认为10 */
@property (nonatomic, assign) CGFloat  shadowInnerRadius;
/** 阴影颜色，默认为0.3透明度的灰色 */
@property (nonatomic, strong) UIColor *shadowFillColor;

/** 自动调整角度，使进度条开口向下并且左右对称，默认为YES */
@property (nonatomic, assign) BOOL     autoAdjustAngle;

@end
