//
//  ViewController.m
//  RulerDemo
//
//  Created by wangwendong on 16/3/28.
//  Copyright © 2016年 sunricher. All rights reserved.
//

#import "ViewController.h"
#import "RulerView.h"
#import "RulerItemModel.h"

@interface ViewController () <RulerViewDatasource, RulerViewDelegate>
@property (weak, nonatomic) IBOutlet RulerView *rulerView;

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _rulerView.datasource = self;
    _rulerView.delegate = self;
    
    [_rulerView updateCurrentValue:175];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_rulerView reloadView];
}

#pragma mark - RulerViewDelegate

- (void)rulerView:(RulerView *)rulerView didChangedCurrentValue:(CGFloat)currentValue {
    NSInteger value = round(currentValue);
    
    NSString *valueString = [NSString stringWithFormat:@"%d cm", (int)value];
    
    _valueLabel.text = valueString;
}

#pragma mark - RulerViewDatasrouce

#pragma mark - Item setting

- (RulerItemModel *)rulerViewRulerItemModel:(RulerView *)rulerView {
    RulerItemModel *itemModel = [[RulerItemModel alloc] init];
    
    itemModel.itemLineColor = [UIColor blueColor];
    itemModel.itemMaxLineWidth = 30;
    itemModel.itemMinLineWidth = 20;
    itemModel.itemMiddleLineWidth = 24;
    itemModel.itemLineHeight = 1;
    itemModel.itemNumberOfRows = 20;
    itemModel.itemHeight = 60;
    itemModel.itemWidth = itemModel.itemMaxLineWidth;
    
    return itemModel;
}

#pragma mark - Ruler setting

- (CGFloat)rulerViewMaxValue:(RulerView *)rulerView {
    return 250;
}

- (CGFloat)rulerViewMinValue:(RulerView *)rulerView {
    return 50;
}

- (UIFont *)rulerViewTextLabelFont:(RulerView *)rulerView {
    return [UIFont systemFontOfSize:11.f];
}

- (UIColor *)rulerViewTextLabelColor:(RulerView *)rulerView {
    return [UIColor magentaColor];
}

- (CGFloat)rulerViewTextlabelLeftMargin:(RulerView *)rulerView {
    return 4.f;
}

- (CGFloat)rulerViewItemScrollViewDecelerationRate:(RulerView *)rulerView {
    return 0;
}

#pragma mark - Left tag setting

- (CGFloat)rulerViewLeftTagLineWidth:(RulerView *)rulerView {
    return 30;
}

- (CGFloat)rulerViewLeftTagLineHeight:(RulerView *)rulerView {
    return 2;
}

- (UIColor *)rulerViewLeftTagLineColor:(RulerView *)rulerView {
    return [UIColor redColor];
}

- (CGFloat)rulerViewLeftTagTopMargin:(RulerView *)rulerView {
    return 60;
}

@end
