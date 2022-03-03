#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(AdvancedNativeAudioPlugin, "AdvancedNativeAudio",
          CAP_PLUGIN_METHOD(preload, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(play, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(resume, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(pause, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(stop, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(unload, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(setVolume, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(getVolume, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(getCurrentTime, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(setCurrentTime, CAPPluginReturnPromise);
          CAP_PLUGIN_METHOD(getDuration, CAPPluginReturnPromise);
)
