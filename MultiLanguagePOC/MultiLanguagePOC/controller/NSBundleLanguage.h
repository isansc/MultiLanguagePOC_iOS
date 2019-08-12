//
//  NSBundleLanguage.h
//  MultiLanguagePOC
//
//  Created by Isan Campos on 12/08/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Language)
    +(void)setLanguage:(NSString*)language;
    +(void)loadLanguage;
@end

NS_ASSUME_NONNULL_END
