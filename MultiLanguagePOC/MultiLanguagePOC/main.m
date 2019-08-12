//
//  main.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 06/08/19.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSBundleLanguage.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [NSBundle loadLanguage];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
