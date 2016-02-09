//
//  manageData.h
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/8/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface manageData : NSObject

-(void)saveApps:(NSMutableArray *) apps;
-(NSMutableArray *) appsSaved;
@end
