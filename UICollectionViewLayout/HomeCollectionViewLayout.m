//
//  HomeCollectionViewFlowLayout.m
//  UICollectionViewLayout
//
//  Created by LZY on 22/11/2016.
//  Copyright © 2016 https://github.com/ocliuziyang/ZYCycleView . All rights reserved.
//

#import "HomeCollectionViewLayout.h"

@interface HomeCollectionViewLayout ()
@property (nonatomic, strong)NSMutableArray *layoutInfoArr;//布局信息
@property (nonatomic, assign)CGSize contentSize;//内容尺寸
@property (nonatomic, assign)NSInteger maxItemCount;
@end

@implementation HomeCollectionViewLayout



- (void)prepareLayout {
    [super prepareLayout];
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    
    NSInteger numberOfsections = [self.collectionView numberOfSections];
    
    NSInteger maxItemCount = 0;
    
    for (NSInteger section = 0; section < numberOfsections; section++) {
        
        NSInteger numberOfItemsInSection = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *subArr = [NSMutableArray arrayWithCapacity:numberOfItemsInSection];
        for (NSInteger item = 0; item < numberOfItemsInSection; item++) {
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:item inSection:section];
            UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [subArr addObject:layoutAttributes];
        }
        if (numberOfItemsInSection > maxItemCount) {
            maxItemCount = numberOfItemsInSection;
        }
        [layoutInfoArr addObjectsFromArray:subArr];
    }
    
    self.layoutInfoArr = layoutInfoArr;
    self.maxItemCount = maxItemCount;
    self.contentSize = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
}

- (CGSize)collectionViewContentSize {
    
    return self.contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    layoutAttr.size = CGSizeMake(self.collectionView.bounds.size.width - 80, self.collectionView.bounds.size.height - 160);
    layoutAttr.center = self.collectionView.center;
//    layoutAttr.zIndex = 3;
    return layoutAttr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    return self.layoutInfoArr;
}

@end
