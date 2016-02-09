//
//  titleModel.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "titleModel.h"

@implementation titleModel

#define klabelKey       @"label"

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"label"    : klabelKey
             };
}

#pragma mark NSCoding

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:_label forKey:klabelKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if (self) {
        _label = [decoder decodeObjectForKey:klabelKey];
    }
    return self;
    
    
    return self;
}


@end
