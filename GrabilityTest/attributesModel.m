//
//  attributesModel.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "attributesModel.h"

@implementation attributesModel

#define kamountKey       @"amount"
#define kheightKey       @"height"
#define kschemeKey       @"scheme"
#define krelKey       @"rel"
#define khrefKey       @"href"
#define kbundleIdKey       @"im:bundleId"
#define klabelKey       @"label"
#define kidKey       @"im:id"
#define kcurrencyKey       @"currency"
#define ktypeKey       @"type"
#define ktermKey       @"term"



#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"amount"      : kamountKey,
             @"height" : kheightKey,
             @"scheme"    : kschemeKey,
             @"rel"    : krelKey,
             @"href"    : khrefKey,
             @"imBundleId"    : kbundleIdKey,
             @"label"    : klabelKey,
             @"imId"    : kidKey,
             @"currency"    : kcurrencyKey,
             @"type"    : ktypeKey,
             @"term"    : ktermKey
             };
}

#pragma mark NSCoding

- (void) encodeWithCoder:(NSCoder *)encoder {
    
    [encoder encodeObject:_amount forKey:kamountKey];
    [encoder encodeObject:_height forKey:kheightKey];
    [encoder encodeObject:_scheme forKey:kschemeKey];
    [encoder encodeObject:_rel forKey:krelKey];
    [encoder encodeObject:_href forKey:khrefKey];
    [encoder encodeObject:_imBundleId forKey:kbundleIdKey];
    [encoder encodeObject:_label forKey:klabelKey];
    [encoder encodeObject:_imId forKey:kidKey];
    [encoder encodeObject:_currency forKey:kcurrencyKey];
    [encoder encodeObject:_type forKey:ktypeKey];
    [encoder encodeObject:_term forKey:ktermKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if (self) {
        _amount = [decoder decodeObjectForKey:kamountKey];
        _height = [decoder decodeObjectForKey:kheightKey];
        _scheme = [decoder decodeObjectForKey:kschemeKey];
        _rel = [decoder decodeObjectForKey:krelKey];
        _href = [decoder decodeObjectForKey:khrefKey];
        _imBundleId = [decoder decodeObjectForKey:kbundleIdKey];
        _label = [decoder decodeObjectForKey:klabelKey];
        _imId = [decoder decodeObjectForKey:kidKey];
        _currency = [decoder decodeObjectForKey:kcurrencyKey];
        _type = [decoder decodeObjectForKey:ktypeKey];
        _term = [decoder decodeObjectForKey:ktermKey];
    }
    return self;
    
    
    return self;
}


@end
