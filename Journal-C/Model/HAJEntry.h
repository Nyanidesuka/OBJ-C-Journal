//
//  HAJEntry.h
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HAJEntry : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *textBody;
@property (nonatomic, copy) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString*)title body:(NSString*)body;

@end

NS_ASSUME_NONNULL_END
