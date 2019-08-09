//
//  LanguageViewController.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 08/08/19.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgHello;

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.imgHello setImage:[UIImage imageNamed:NSLocalizedString(@"imgHello", nil)]];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
