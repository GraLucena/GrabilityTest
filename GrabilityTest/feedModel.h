//
//  feed.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "MTLModel.h"
#import <Foundation/Foundation.h>
#import <Mantle.h>

@class entryModel;

@interface feedModel : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSArray<entryModel *> *entry;

@end
