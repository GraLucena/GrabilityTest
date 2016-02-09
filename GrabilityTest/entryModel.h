//
//  entry.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/6/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "MTLModel.h"
#import <Foundation/Foundation.h>
#import <Mantle.h>

@class rightsModel, imageModel, nameModel, priceModel, titleModel, summaryModel, contentTypeModel, linkModel, idModel, categoryModel, artistModel, releaseDateModel;

@interface entryModel : MTLModel <MTLJSONSerializing, NSCoding>

@property (nonatomic, strong) contentTypeModel *imcontentType;
@property (nonatomic, strong) rightsModel *rights;
@property (nonatomic, strong) categoryModel *category;
@property (nonatomic, strong) idModel *id;
@property (nonatomic, strong) NSArray<imageModel *> *imimage;
@property (nonatomic, strong) priceModel *imPrice;
@property (nonatomic, strong) linkModel *link;
@property (nonatomic, strong) artistModel *imartist;
@property (nonatomic, strong) nameModel *imname;
@property (nonatomic, strong) titleModel *title;
@property (nonatomic, strong) summaryModel *summary;
@property (nonatomic, strong) releaseDateModel *imreleaseDate;

@end
