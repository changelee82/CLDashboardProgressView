//
//  ViewController.m
//  CLDashboardProgressView
//
//  Created by 李辉 on 15/12/17.
//  Copyright © 2015年 李辉. All rights reserved.
//

#import "ViewController.h"
#import "CLDashboardProgressView.h"


@interface ViewController ()

@property (nonatomic, strong) CLDashboardProgressView *progress;
@property (nonatomic, weak) IBOutlet UILabel *progressLabel;


- (IBAction)addClick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progress = [[CLDashboardProgressView alloc] initWithFrame:CGRectMake(20, 60, 240, 240)];
    _progress.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, 190);
    _progress.backgroundColor = [UIColor blackColor];
    
    _progress.outerRadius = 110; // 外圈半径
    _progress.innerRadius = 95;  // 内圈半径
    _progress.beginAngle = 90;    // 起始角度
    _progress.blockAngle = 8;   // 每个进度块的角度
    _progress.gapAngle = 2;     // 两个进度块的间隙的角度
    _progress.progressColor = [UIColor greenColor]; // 进度条填充色
    _progress.trackColor    = [UIColor redColor];   // 进度条痕迹填充色
    _progress.outlineColor  = [UIColor grayColor];  // 进度条边框颜色
    _progress.outlineWidth  = 2;                    // 进度条边框线宽
    
    _progress.blockCount = 26;   // 进度块的数量
    _progress.minValue = 0;      // 进度条最小数值
    _progress.maxValue = 100;    // 进度条最大数值
    _progress.currentValue = 10; // 进度条当前数值
    
    _progress.showShadow = YES;  // 是否显示阴影
    _progress.shadowOuterRadius = 85; // 阴影外圈半径
    _progress.shadowInnerRadius = 10; // 阴影内圈半径
    _progress.shadowFillColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];   // 阴影颜色
    
    _progress.autoAdjustAngle = YES;  // 自动调整角度
    
    [self.view addSubview:_progress];
    
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f", _progress.currentValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addClick:(UIButton *)sender {
    
    CGFloat value = _progress.currentValue;
    _progress.currentValue = value + 5;
    self.progressLabel.text = [NSString stringWithFormat:@"%.0f", _progress.currentValue];
}
@end
