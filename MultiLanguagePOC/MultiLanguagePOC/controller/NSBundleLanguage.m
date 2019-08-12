//
//  NSBundleLanguage.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 12/08/19.
//

#import "NSBundleLanguage.h"
#import <objc/runtime.h>

static const char _bundle=0;

@interface NSBundleLanguage : NSBundle

@end

@implementation NSBundleLanguage
-(NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}
@end


@implementation NSBundle (Language)

+(void)setLanguage:(NSString*)language
{
    // Saving Language
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"language"];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      object_setClass([NSBundle mainBundle],[NSBundleLanguage class]);
                  });
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void)loadLanguage{
    NSString* language = [[NSUserDefaults standardUserDefaults] objectForKey:@"language"];
    
    if(language == nil){
        language = @"en";
    }
    
    [self setLanguage:language];
}

@end
