#import "DashDetailsViewController.h"
#import "GRMustache.h"

@interface DashDetailsViewController ()

@end

@implementation DashDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TestKeys *testKeys = [self.measurement testKeysObj];
    NSString *rendering = [GRMustacheTemplate renderObject:@{ @"VideoQuality": [testKeys getVideoQuality:NO] } fromString:NSLocalizedString(@"TestResults.Details.Performance.Dash.VideoWithoutBuffering", nil) error:NULL];
    [self.titleLabel setText:[testKeys getVideoQuality:YES]];
    [self.subtitleLabel setText:rendering];
    
    [self.bitrateTitleLabel setText:NSLocalizedString(@"TestResults.Details.Performance.Dash.MedianBitrate", nil)];
    [self.bitrateValueLabel setText:[testKeys getMedianBitrate]];
    [self.bitrateUnitLabel setText:[testKeys getMedianBitrateUnit]];
    
    [self.delayTitleLabel setText:NSLocalizedString(@"TestResults.Details.Performance.Dash.PlayoutDelay", nil)];
    [self.delayValueLabel setText:[testKeys getPlayoutDelay]];
}


@end