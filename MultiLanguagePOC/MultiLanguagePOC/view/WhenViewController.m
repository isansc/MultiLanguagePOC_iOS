//
//  WhenViewController.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 08/08/19.
//

#import "WhenViewController.h"

@interface WhenViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end

@implementation WhenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage* btnImage = [UIImage imageNamed:NSLocalizedString(@"btnNext", nil)];
    [[self btnNext] setBackgroundImage:btnImage forState:UIControlStateNormal];
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
