//
//  ViewController.m
//  CAGradientLayer
//
//  Created by mac on 14/12/2018.
//  Copyright © 2018 Woodsoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUIView];
    
    [self createUIButton];
    
    [self createUILabel];
}

-(void)createUIView{
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
    [self.view addSubview:bgView];
    
    /*
     ***  CAGradientLayer是CALayer的子类
     */
    CAGradientLayer *gLayer = [CAGradientLayer layer];
    gLayer.frame = bgView.bounds;
    
    /*
     ***    colors是渐变颜色的集合，是一个数组，数组中不是UIColor而是CGColor
     这里必须是CGColor不然没有颜色，且要在前面加入__bridge id进行类型转换
     */
    gLayer.colors = [NSArray arrayWithObjects:(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor purpleColor].CGColor, nil];
    
    /*
     ***    locations是用来定义渐变色的区间范围，0~1。并且数据元素个数要和colorsl数据元素个数对应
     */
    //    gLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0.4],[NSNumber numberWithFloat:0.6], nil];
    
    
    //渐变色开始的位置
    gLayer.startPoint= CGPointMake(0, 0);
    //渐变色结束的位置
    gLayer.endPoint = CGPointMake(1, 0);
    
    [bgView.layer addSublayer:gLayer];
}

-(void)createUIButton{
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50)];
    [self.view addSubview:btn];
    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    CAGradientLayer *gLayer = [CAGradientLayer layer];
    gLayer.frame = btn.bounds;
    gLayer.colors = [NSArray arrayWithObjects:(__bridge id)[UIColor grayColor].CGColor,(__bridge id)[UIColor blackColor].CGColor, nil];
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(1, 0);
    [btn.layer addSublayer:gLayer];

}

-(void)createUILabel{

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 300, [UIScreen mainScreen].bounds.size.width, 300)];
    [self.view addSubview:label];
    
    CAGradientLayer *gLayer = [CAGradientLayer layer];
    gLayer.frame = label.bounds;
    gLayer.colors = [NSArray arrayWithObjects:(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor orangeColor].CGColor, nil];
    gLayer.startPoint = CGPointMake(0, 0);
    gLayer.endPoint = CGPointMake(0, 1);
    [label.layer addSublayer:gLayer];
    label.text = @"我是Label";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
}


@end
