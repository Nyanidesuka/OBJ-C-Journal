//
//  HAJEntryController.m
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJEntryController.h"
#import "HAJEntry.h"

@interface HAJEntryController()

@property (nonatomic, strong, readwrite) NSMutableArray* internalEntries;

@end

@implementation HAJEntryController

//genuinely upsetting syntax to create a shared instance
+ (HAJEntryController*)shared{
    static HAJEntryController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [HAJEntryController new];
    });
    return shared;
}

-(instancetype) init
{
    self = [super init];
    if (self){
        _internalEntries = [[NSMutableArray alloc] init];
    }
    return self;
}

//CRUD again because every file is 2 files thanks steve jobs
- (void)addEntry:(HAJEntry *)entry
{
    [self.internalEntries addObject:entry];
    NSLog(@"Internl Entries: %@",[[HAJEntryController shared]internalEntries]);
}

- (void)removeEntry:(HAJEntry *)entry
{
    [self.internalEntries removeObject:entry];
}
//we do this because for some reason even though we defined an immutable array we're never actually goin to use it so we're gonna redirect its get instead of just making a mutable array in the first place.
- (NSArray *) entries
{
    return self.internalEntries;
}



@end
