//
//  Person+CoreDataProperties.h
//  CitySelection
//
//  Created by majinyu on 16/3/28.
//  Copyright © 2016年 com.majinyu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *person_name;
@property (nullable, nonatomic, retain) NSNumber *person_sex;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *relationship;

@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(NSManagedObject *)value;
- (void)removeRelationshipObject:(NSManagedObject *)value;
- (void)addRelationship:(NSSet<NSManagedObject *> *)values;
- (void)removeRelationship:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
