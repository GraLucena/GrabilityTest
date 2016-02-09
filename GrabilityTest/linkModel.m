//
//  linkModel.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "linkModel.h"
#import "attributesModel.h"

@implementation linkModel

#define kattributesKey       @"attributes"

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"attributes"    : kattributesKey
             };
}

- (NSValueTransformer *)stateJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:attributesModel.class];
}

#pragma mark NSCoding

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:_attributes forKey:kattributesKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if (self) {
        _attributes = [decoder decodeObjectForKey:kattributesKey];
    }
    return self;
    
    
    return self;
}


@end
