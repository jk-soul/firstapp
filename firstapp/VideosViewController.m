//
//  VideosViewController.m
//  firstapp
//
//  Created by ipad on 2019/12/11.
//  Copyright © 2019 ipad. All rights reserved.
//

#import "VideosViewController.h"

@interface VideosViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation VideosViewController

- (instancetype)init{
    if(self= [super init]){
        
        self.view.backgroundColor = [UIColor whiteColor];
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"shop"];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize =CGSizeMake((self.view.frame.size.width - 10 )/2, 300);

    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collection.backgroundColor = [UIColor whiteColor];
    collection.dataSource = self;
    collection.delegate = self;
    
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionCell"];
    
    [self.view addSubview:collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
};

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
    
    
};


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item %3 == 0){
        return CGSizeMake(self.view.bounds.size.width, 300);
    }else{
        return CGSizeMake((self.view.bounds.size.width - 10)/2, 300);
    }
};
@end
