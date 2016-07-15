//
//  Book+CoreDataProperties.h
//  CitySelection
//
//  Created by majinyu on 16/3/28.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *book_name;
@property (nullable, nonatomic, retain) NSNumber *book_number;
@property (nullable, nonatomic, retain) Person *relationship;

@end

NS_ASSUME_NONNULL_END
