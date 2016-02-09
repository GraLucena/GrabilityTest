//
//  CategoriesTableViewCell.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/8/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *categoryImage;
@property (weak, nonatomic) IBOutlet UILabel *categoryName;

@end
