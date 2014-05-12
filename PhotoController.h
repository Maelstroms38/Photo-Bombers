//
//  PhotoController.h
//  Photo Bombers
//
//  Created by Michael Stromer on 5/5/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoController : NSObject

+ (void)imageForPhoto:(NSDictionary *)photo size:(NSString *) size completion:(void(^)(UIImage *image))completion;

@end
