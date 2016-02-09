//
//  AppsCollectionViewCell.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/9/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppsCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *appImage;
@property (weak, nonatomic) IBOutlet UILabel *appName;

@end
