//
//  entry.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "entryModel.h"
#import "contentTypeModel.h"
#import "rightsModel.h"
#import "categoryModel.h"
#import "idModel.h"
#import "priceModel.h"
#import "linkModel.h"
#import "artistModel.h"
#import "nameModel.h"
#import "titleModel.h"
#import "summaryModel.h"
#import "releaseDateModel.h"
#import "imageModel.h"

@implementation entryModel

#define kcontentTypeKey       @"im:contentType"
#define krightsKey       @"rights"
#define kcategoryKey       @"category"
#define kidKey       @"id"
#define kpriceKey       @"im:price"
#define klinkKey       @"link"
#define kartistKey       @"im:artist"
#define knameKey       @"im:name"
#define ktitleKey       @"title"
#define ksummaryKey       @"summary"
#define kreleaseDateKey       @"im:releaseDate"
#define kimageKey       @"im:image"


#pragma mark - Mantle related methods
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    
    return @{
             @"imcontentType"      : kcontentTypeKey,
             @"rights" : krightsKey,
             @"category"    : kcategoryKey,
             @"id"    : kidKey,
             @"imPrice"    : kpriceKey,
             @"link"    : klinkKey,
             @"imartist"    : kartistKey,
             @"imname"    : knameKey,
             @"title"    : ktitleKey,
             @"summary"    : ksummaryKey,
             @"imreleaseDate"    : kreleaseDateKey,
             @"imimage" : kimageKey
             };
}

- (NSValueTransformer *)linkJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:linkModel.class];
}

- (NSValueTransformer *)contentTypeJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:contentTypeModel.class];
}

- (NSValueTransformer *)rightsJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:rightsModel.class];
}

- (NSValueTransformer *)categoryJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:categoryModel.class];
}

- (NSValueTransformer *)idJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:idModel.class];
}

- (NSValueTransformer *)priceJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:priceModel.class];
}

- (NSValueTransformer *)artistJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:artistModel.class];
}

- (NSValueTransformer *)nameJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:nameModel.class];
}

- (NSValueTransformer *)titleJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:titleModel.class];
}

- (NSValueTransformer *)summaryJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:summaryModel.class];
}

- (NSValueTransformer *)releaseDateJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:releaseDateModel.class];
}

- (NSValueTransformer *)imageJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:imageModel.class];
}

#pragma mark NSCoding

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_imcontentType forKey:kcontentTypeKey];
    [encoder encodeObject:_rights forKey:krightsKey];
    [encoder encodeObject:_category forKey:kcategoryKey];
    [encoder encodeObject:_id forKey:kidKey];
    [encoder encodeObject:_imPrice forKey:kpriceKey];
    [encoder encodeObject:_link forKey:klinkKey];
    [encoder encodeObject:_imartist forKey:kartistKey];
    [encoder encodeObject:_imname forKey:knameKey];
    [encoder encodeObject:_title forKey:ktitleKey];
    [encoder encodeObject:_summary forKey:ksummaryKey];
    [encoder encodeObject:_imreleaseDate forKey:kreleaseDateKey];
    [encoder encodeObject:_imimage forKey:kimageKey];
}

- (id)initWithCoder:(NSCoder *)decoder {

    if (self) {
        _imcontentType = [decoder decodeObjectForKey:kcontentTypeKey];
        _rights = [decoder decodeObjectForKey:krightsKey];
        _category = [decoder decodeObjectForKey:kcategoryKey];
        _id = [decoder decodeObjectForKey:kidKey];
        _imPrice = [decoder decodeObjectForKey:kpriceKey];
        _link = [decoder decodeObjectForKey:klinkKey];
        _imartist = [decoder decodeObjectForKey:kartistKey];
        _imname = [decoder decodeObjectForKey:knameKey];
        _title = [decoder decodeObjectForKey:ktitleKey];
        _summary = [decoder decodeObjectForKey:ksummaryKey];
        _imreleaseDate = [decoder decodeObjectForKey:kreleaseDateKey];
        _imimage = [decoder decodeObjectForKey:kimageKey];

    }
    return self;

    
    return self;
}

@end
