import { WebPlugin } from '@capacitor/core';

import type { AdvancedNativeAudioPlugin, ConfigureOptions, PreloadOptions } from './definitions';


export class AdvancedNativeAudioWeb extends WebPlugin implements AdvancedNativeAudioPlugin {
  resume (options: { assetId: string; }): Promise<void> {
    console.log(options)
    throw new Error('Method not implemented.');
  }
  pause (options: { assetId: string; }): Promise<void> {
    console.log(options)
    throw new Error('Method not implemented.');
  }
  getCurrentTime (options: { assetId: string }): Promise<{ time: number; }> {
    console.log(options)
    throw new Error('Method not implemented.');
  }
  setCurrentTime (options: { assetId: string; time: number }): Promise<void> {
    console.log(options)
    throw new Error('Method not implemented.');
  }
  getDuration (options: { assetId: string; }): Promise<{ duration: number; }> {
    console.log(options);
    throw new Error('Method not implemented.');
  }
  configure(options: ConfigureOptions): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  preload(options: PreloadOptions): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  play(options: { assetId: string }): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  loop(options: { assetId: string }): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  stop(options: { assetId: string }): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  unload(options: { assetId: string }): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  getVolume(options: { assetId: string }): Promise<{ volume: number }> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
  setVolume(options: { assetId: string; volume: number }): Promise<void> {
    console.log(options);
    throw new Error("Method not implemented.");
  }
}

