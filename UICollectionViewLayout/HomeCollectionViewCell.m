//
//  HomeCollectionViewCell.m
//  UICollectionViewLayout
//
//  Created by LZY on 22/11/2016.
//  Copyright © 2016 https://github.com/ocliuziyang/ZYCycleView . All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell ()<UIGestureRecognizerDelegate>

@end

@implementation HomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupView];
    
}

- (void)setupView {
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gesture:)];
    gesture.delegate = self;
    [self addGestureRecognizer:gesture];
    
}

- (void)gesture:(UIPanGestureRecognizer *)gesture {
    
    CGPoint translation = [gesture translationInView:gesture.view];

    //代理调用
    if (self.delegate && [self.delegate respondsToSelector:@selector(cell:translation:)]) {
        [self.delegate cell:self translation:translation];
    } else {
        NSLog(@"未设置HomeCollectionViewCell 代理或者代理方法未实现");
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    NSLog(@"%s", __func__);
    
    return YES;
}

@end
