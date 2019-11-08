#include <dlfcn.h>
#include <assert.h>

extern "C" {

typedef int (*resp_t)(int,int,int,int,void*,size_t);

extern int _ZN5radio24currentSignalStrengthIndEiii9RIL_ErrnoPvj(
        int slotId, int indicationType, int token, int e, void *response, size_t responseLen)
{
    static resp_t orig = 0;
    if (!orig)
        orig = (resp_t) dlsym(RTLD_NEXT, __func__);
    assert(orig != NULL);
    if (responseLen == 0x4c)
        return orig(slotId, indicationType, token, e, response, 56);
    else
        return orig(slotId, indicationType, token, e, response, responseLen);
}

extern int _ZN5radio25getSignalStrengthResponseEiii9RIL_ErrnoPvj(
        int slotId, int responseType, int serial, int e, void *response, size_t responseLen)
{
    static resp_t orig = 0;
    if (!orig)
        orig = (resp_t) dlsym(RTLD_NEXT, __func__);
    assert(orig != NULL);
    if (responseLen == 0x4c)
        return orig(slotId, responseType, serial, e, response, 56);
    else
        return orig(slotId, responseType, serial, e, response, responseLen);
}

extern int _ZN14TrafficControl15connectToServerEb(bool) {
    return -1;
}

}
