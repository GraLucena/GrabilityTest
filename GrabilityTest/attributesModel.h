//
//  attributesModel.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "MTLModel.h"
#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface attributesModel : MTLModel <MTLJSONSerializing, NSCoding>

@property (copy, nonatomic) NSString *amount;
@property (copy, nonatomic) NSString *height;
@property (copy, nonatomic) NSString *scheme;
@property (copy, nonatomic) NSString *rel;
@property (copy, nonatomic) NSString *href;
@property (copy, nonatomic) NSString *imBundleId;
@property (copy, nonatomic) NSString *label;
@property (copy, nonatomic) NSString *imId;
@property (copy, nonatomic) NSString *currency;
@property (copy, nonatomic) NSString *type;
@property (copy, nonatomic) NSString *term;

@end
