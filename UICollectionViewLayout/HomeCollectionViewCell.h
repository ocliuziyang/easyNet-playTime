//
//  HomeCollectionViewCell.h
//  UICollectionViewLayout
//
//  Created by LZY on 22/11/2016.
//  Copyright © 2016 https://github.com/ocliuziyang/ZYCycleView . All rights reserved.
//

#import <UIKit/UIKit.h>



@class HomeCollectionViewCell;
@protocol HomeCollectionViewCellDelegate <NSObject>

- (void)cell:(HomeCollectionViewCell *)cell translation:(CGPoint)translation;

@end

@interface HomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak)id <HomeCollectionViewCellDelegate>delegate;

@end
