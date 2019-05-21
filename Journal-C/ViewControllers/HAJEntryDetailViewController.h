//
//  HAJEntryDetailViewController.h
//  Journal-C
//
//  Created by Haley Jones on 5/20/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HAJEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface HAJEntryDetailViewController : UIViewController <UITextFieldDelegate>

//landing pad is a property so it goes up here in the headerator
@property (nonatomic, strong) HAJEntry *entry;

- (void) updateViewsWithEntry:(HAJEntry*)entry;

@end

NS_ASSUME_NONNULL_END
