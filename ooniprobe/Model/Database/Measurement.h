#import <Foundation/Foundation.h>
#import <SharkORM/SharkORM.h>
#import "JsonResult.h"
#import "Network.h"
#import "Url.h"

@class Result;

@interface Measurement : SRKObject

@property NSString *test_name;
@property NSDate *start_time;
@property float runtime;
@property BOOL is_done;
@property BOOL is_uploaded;
@property BOOL is_failed;
@property NSString *failure_msg;
@property BOOL is_upload_failed;
@property NSString *upload_failure_msg;
@property BOOL is_rerun;
@property NSString *report_id;
@property Url *url_id;
@property long measurement_id;
@property BOOL is_anomaly;
@property NSString *test_keys;
@property Result *result_id;

@property (strong, nonatomic) TestKeys *testKeysObj;

-(NSString*)getReportFile;
-(NSString*)getLogFile;
-(TestKeys*)testKeysObj;
-(void)setTestKeysObj:(TestKeys *)testKeysObj;
-(NSString*)getLocalizedStartTime;
-(void)save;
-(void)setReRun;
-(void)deleteObject;

@end
