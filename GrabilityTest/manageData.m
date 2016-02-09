//
//  manageData.m
//  GrabilityTest
//
//  Created by Graciela Lucena on 2/8/16.
//  Copyright © 2016 Graciela Lucena. All rights reserved.
//

#import "manageData.h"
#import "entryModel.h"

@implementation manageData

-(void)saveApps:(NSMutableArray *) apps{
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    [dataDict setObject:apps forKey:@"apps"];
    
    // save data.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}

-(NSMutableArray *) appsSaved{
    
    // look for saved data.
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    NSDictionary *savedData;
    NSMutableArray *apps;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        savedData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
    }
    
    if (savedData != nil) {
        apps = [[NSMutableArray alloc] initWithArray:[savedData objectForKey:@"apps"]];
    }
    return apps;
}

@end
