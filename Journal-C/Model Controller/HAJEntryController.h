//
//  HAJEntryController.h
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HAJEntry.h"
NS_ASSUME_NONNULL_BEGIN

@interface HAJEntryController : NSObject

@property (readonly, nonatomic) NSArray* entries;
//this makes the shared instance
+ (HAJEntryController*)shared;


//CRUD
- (void)addEntry:(HAJEntry *)entry;
- (void)removeEntry:(HAJEntry *)entry;
@end

NS_ASSUME_NONNULL_END
