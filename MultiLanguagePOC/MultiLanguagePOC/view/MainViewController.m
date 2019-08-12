//
//  ViewController.m
//  MultiLanguagePOC
//
//  Created by Isan Campos on 06/08/19.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblDynamic;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated{
    [self updateDynamicLabel];
    
    UIImage* btnImage = [UIImage imageNamed:NSLocalizedString(@"btnNext", nil)];
    [[self btnNext] setBackgroundImage:btnImage forState:UIControlStateNormal];
}

- (IBAction)btnShowAlertClick:(id)sender {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:NSLocalizedString(@"Document", nil)
                                 message:NSLocalizedString(@"Is the document there?", nil)
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:NSLocalizedString(@"Yes", nil)
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your yes please button action here
                                     [self updateDynamicLabel];
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"No", nil)
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   //Handle no, thanks button
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)updateDynamicLabel{
    
    NSString *strTemp = [NSString stringWithFormat:NSLocalizedString(@"Now is %@", nil),[self getCurrentDate]];
    self.lblDynamic.text = strTemp;
    
}

-()getCurrentDate{
    NSDate* currentDate = [NSDate date];
    NSTimeZone* currentTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    NSTimeZone* nowTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:currentDate];
    NSInteger nowGMTOffset = [nowTimeZone secondsFromGMTForDate:currentDate];
    
    NSTimeInterval interval = nowGMTOffset - currentGMTOffset;
    NSDate* nowDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:currentDate];
    
    NSDateFormatter *dateformater = [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [dateformater stringFromDate: nowDate];
    
    return str;
}

@end
