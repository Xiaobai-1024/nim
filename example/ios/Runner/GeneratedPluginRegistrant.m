//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<device_info_plus/FLTDeviceInfoPlusPlugin.h>)
#import <device_info_plus/FLTDeviceInfoPlusPlugin.h>
#else
@import device_info_plus;
#endif

#if __has_include(<device_information/DeviceInformationPlugin.h>)
#import <device_information/DeviceInformationPlugin.h>
#else
@import device_information;
#endif

#if __has_include(<integration_test/IntegrationTestPlugin.h>)
#import <integration_test/IntegrationTestPlugin.h>
#else
@import integration_test;
#endif

#if __has_include(<nim_core/NimCorePlugin.h>)
#import <nim_core/NimCorePlugin.h>
#else
@import nim_core;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<yunxin_alog/FlutterAlogPlugin.h>)
#import <yunxin_alog/FlutterAlogPlugin.h>
#else
@import yunxin_alog;
#endif

#if __has_include(<yunxin_integration_test/YunxinIntegrationTestPlugin.h>)
#import <yunxin_integration_test/YunxinIntegrationTestPlugin.h>
#else
@import yunxin_integration_test;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTDeviceInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTDeviceInfoPlusPlugin"]];
  [DeviceInformationPlugin registerWithRegistrar:[registry registrarForPlugin:@"DeviceInformationPlugin"]];
  [IntegrationTestPlugin registerWithRegistrar:[registry registrarForPlugin:@"IntegrationTestPlugin"]];
  [NimCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"NimCorePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FlutterAlogPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterAlogPlugin"]];
  [YunxinIntegrationTestPlugin registerWithRegistrar:[registry registrarForPlugin:@"YunxinIntegrationTestPlugin"]];
}

@end
