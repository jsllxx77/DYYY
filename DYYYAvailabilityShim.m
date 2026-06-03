#import <Foundation/Foundation.h>
#include <stdint.h>

// Linux Theos toolchains may not ship/compiler-link the availability runtime
// helper that Clang emits for @available(...). Provide the same symbol so
// the tweak can link; iOS target is 14.0+, where NSProcessInfo version APIs
// are available.
int32_t __isOSVersionAtLeast(int32_t major, int32_t minor, int32_t subminor) {
    NSOperatingSystemVersion version = [[NSProcessInfo processInfo] operatingSystemVersion];

    if (version.majorVersion != major) {
        return version.majorVersion > major;
    }
    if (version.minorVersion != minor) {
        return version.minorVersion > minor;
    }
    return version.patchVersion >= subminor;
}
