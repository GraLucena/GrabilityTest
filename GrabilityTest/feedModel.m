//
//  feed.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "feedModel.h"
#import "entryModel.h"

@interface feedModel () <MTLJSONSerializing>

@end

@implementation feedModel

#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"entry"    : @"entry"
             };
}

- (NSValueTransformer *)entryJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:entryModel.class];
}

@end
