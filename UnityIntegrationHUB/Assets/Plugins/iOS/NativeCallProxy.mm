#import <Foundation/Foundation.h>
#import "NativeCallProxy.h"


@implementation FrameworkLibAPI

id<NativeCallsProtocol> api = NULL;
+(void) registerAPIforNativeCalls:(id<NativeCallsProtocol>) aApi
{
    api = aApi;
}

@end


extern "C" {

    char* cStringCopy(const char* string) {
        if (string == NULL)
            return NULL;
        char* res = (char*)malloc(strlen(string) + 1);
        strcpy(res, string);
        return res;
    }

    void _didSceneStartLoad() {
        return [api didSceneStartLoad];
    }

    void _didSceneFinishLoad() {
        return [api didSceneFinishLoad];
    }

    char* _getSceneIdentifier() {
        NSString *bundle = [api getSceneIdentifier];
        char* param = cStringCopy([bundle UTF8String]);
        return param;
    }

    char* _getScenesAssetBundlePath() {
        NSString *bundle = [api getScenesAssetBundlePath];
        char* param = cStringCopy([bundle UTF8String]);
        return param;
    }

    char* _getResourcesAssetBundlePath() {
        NSString *bundle = [api getResourcesAssetBundlePath];
        char* param = cStringCopy([bundle UTF8String]);
        return param;
    }

    void _sendMessage(const char* message) {
        return [api sendMessage:[NSString stringWithUTF8String:message]];
    }

}
