#import "Settings.h"
#import "ReachabilityManager.h"
#import "SettingsUtility.h"

@implementation Settings

- (id)init {
    self = [super init];
    if (self) {
        self.annotations = @{@"network_type" : [[ReachabilityManager sharedManager] getStatus]};
        self.disabled_events = @[@"status.queued", @"status.update.websites", @"failure.report_close"];
        self.log_level = [SettingsUtility getVerbosity];
        self.options = [Options new];
    }
    return self;
}


// Serialize settings to JSON.
- (NSString*)getSerializedSettings {
    NSString *serializedSettings = nil;
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self dictionary]
                                                   options:0 error:&error];
    if (error != nil) {
        NSLog(@"Cannot serialize settings to JSON");
        return nil;
    }
    // Using initWithData because data is not terminated by zero.
    serializedSettings = [[NSString alloc] initWithData:data
                                                encoding:NSUTF8StringEncoding];
    if (serializedSettings == nil) {
        NSLog(@"Cannot convert serialized JSON to string");
        return nil;
    }
    //TODO-2.1 fix this in mk
    serializedSettings = [serializedSettings stringByReplacingOccurrencesOfString:@"ca_bundle_path" withString:@"net/ca_bundle_path"];
    //NSLog(@"%@", serializedSettings);
    return serializedSettings;
}



@end