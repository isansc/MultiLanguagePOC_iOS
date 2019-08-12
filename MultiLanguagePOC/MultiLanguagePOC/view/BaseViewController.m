//
//  BaseViewController.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 12/08/19.
//

#import "BaseViewController.h"
#import "NSBundleLanguage.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLanguageButton];
}

-(void)setupLanguageButton{

    if(self.navigationItem != nil){
        UIBarButtonItem* btnLanguage = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Language", nil) style:UIBarButtonItemStyleDone target:self action:@selector(showLanguageMenu)];
        [self.navigationItem setRightBarButtonItem:btnLanguage];
    }
}

-(void)showLanguageMenu{
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:NSLocalizedString(@"Language", nil)
                                message:nil
                                preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *optEnglish = [UIAlertAction
                                 actionWithTitle:NSLocalizedString(@"English", nil)
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [self changeLanguage:@"en"];
                                 }];
    
    UIAlertAction *optPortuguese = [UIAlertAction
                                    actionWithTitle:NSLocalizedString(@"Portuguese", nil)
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        [self changeLanguage:@"pt"];
                                    }];
    
    UIAlertAction *optJapanese = [UIAlertAction
                                  actionWithTitle:NSLocalizedString(@"Japanese", nil)
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action) {
                                      [self changeLanguage:@"ja"];
                                  }];
    
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:NSLocalizedString(@"Cancel", nil)
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action) {
                                 
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                             }];
    
    alert.popoverPresentationController.sourceView = self.view;
    //    alert.popoverPresentationController.sourceRect = self.btnLanguage.frame;
    
    [alert addAction:optEnglish];
    [alert addAction:optPortuguese];
    [alert addAction:optJapanese];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)changeLanguage:(NSString *)language{
    
    [NSBundle setLanguage:language];
    
//    // Reload our root view controller
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSString *storyboardName = @"Main"; // Your storyboard name, if there is more than one, its name should be received from parameter
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];

    delegate.window.rootViewController = [storyboard instantiateInitialViewController];
}


@end
