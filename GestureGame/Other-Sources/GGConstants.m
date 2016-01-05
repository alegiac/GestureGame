//
//  GGConstants.m
//  GestureGame
//
//  Created by Alessandro Giacomella on 1/5/16
//  Copyright (c) 2014 Alessandro Giacomella. All rights reserved.
//

#import "GestureGame-Environment.h"

// Use this file to define the values of the variables declared in the header.
// For data types that aren't compile-time constants (e.g. NSURL), use the
// GGConstantsInitializer function below.

// See GestureGame-Environment.h for macros that are likely applicable in
// this file. TARGETING_{STAGING,PRODUCTION} and IF_STAGING are probably
// the most useful.

// The values here are just examples.

#ifdef TARGETING_STAGING

//NSString * const GGAPIKey = @"StagingKey";

#else

//NSString * const GGAPIKey = @"ProductionKey";

#endif


//NSURL *GGAPIRoot;
void __attribute__((constructor)) GGConstantsInitializer()
{
//    GGAPIRoot = [NSURL URLWithString:IF_STAGING(@"http://myapp.com/api/staging", @"http://myapp.com/api")];
}