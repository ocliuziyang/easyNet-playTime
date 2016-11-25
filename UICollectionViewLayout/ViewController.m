//
//  ViewController.m
//  UICollectionViewLayout
//
//  Created by LZY on 22/11/2016.
//  Copyright © 2016 https://github.com/ocliuziyang/ZYCycleView . All rights reserved.
//

#import "ViewController.h"
#import "HomeCollectionViewLayout.h"
#import "HomeCollectionViewCell.h"

static NSString * const identifierHomeCollectionViewCell = @"HomeCollectionViewCell";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, HomeCollectionViewCellDelegate>
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation ViewController

#pragma mark - ♻️ lifeCycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}


#pragma mark - 🔒 PrivateMethods


#pragma mark - 🎉 EventResponse


#pragma mark - 🔌 HomeCollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:identifierHomeCollectionViewCell forIndexPath:indexPath];
    cell.delegate = self;
    return cell;
    
}

#pragma mark - 🔌 HomeCollectionViewDelegate


#pragma mark - 🔌 Custom Delegate
- (void)cell:(HomeCollectionViewCell *)cell translation:(CGPoint)translation {
    
        NSLog(@"x:%0.0f, y:%0.0f", translation.x, translation.y);
    CGAffineTransform transform = CGAffineTransformMake(0, 0, 0, 0, translation.x, translation.y);
    [cell setTransform:transform];
    
}
#pragma mark - 🌝 LazyLoading
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        HomeCollectionViewLayout *layout = [[HomeCollectionViewLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifierHomeCollectionViewCell];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    
    return _collectionView;
}

@end
