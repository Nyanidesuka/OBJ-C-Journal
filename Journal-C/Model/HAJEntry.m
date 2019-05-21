//
//  HAJEntry.m
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import "HAJEntry.h"

@implementation HAJEntry

- (instancetype)initWithTitle:(NSString *)title body:(NSString *)body
{
    self = [super init];
    if (self){
        self.title = title;
        self.textBody = body;
        self.timestamp = [NSDate date];
    }
    return self;
}

@end
