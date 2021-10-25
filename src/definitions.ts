import type { PluginListenerHandle } from '@capacitor/core';

export interface AdvancedNativeAudioPlugin {
  configure(options: ConfigureOptions): Promise<void>;

  /**
   * This method will load more optimized audio files for background into memory.
   * 
   * @param options - Options that describes the behaviour of the player and track
   * 
   * @since 1.0.0
  */
  preload(options: PreloadOptions): Promise<void>;

  /**
   * This method will play the loaded audio file if present in the memory.
   * 
   * @param options - define assetId to identify asset, set time to add seek.
   */
  play(options: PlayOptions): Promise<void>;

  /**
   * This method will resume the loaded audio file if it's currently in pause.
   * 
   * @param options - define assetId to identify asset.
   * 
   */
  resume(options: CommonOptions): Promise<void>;

  /**
   * This method will pause the loaded audio file if it's currently playing.
   * 
   * @@param options - define assetId to identify asset.
   * 
   */
  pause(options: CommonOptions): Promise<void>;

  /**
   * This method will loop the audio file for playback.
   * @param options - define assetId to identify asset.
   */
  loop(options: CommonOptions): Promise<void>;

  /**
   * This method will stop the audio file if it's currently playing.
   * 
   * @param options - define assetId to identify asset.
   * 
   */
  stop(options: CommonOptions): Promise<void>;

  /**
   * This method will unload the audio file from the memory.
   * 
   * @param  options - define assetId to identify asset.
   * 
   */
  unload(options: CommonOptions): Promise<void>;

  /**
   * This method will set the new volume for a audio file.
   * 
   * @param options - define assetId to identify asset, volume to set numerical value of the volume between 0 - 1.0
   * 
   */
  setVolume(options: VolumeOptions): Promise<void>;

  /**
   * This method will get the current volume for a audio file.
   * 
   * @param options - define assetId to identify asset.
   * 
   */
  getVolume(options: CommonOptions): Promise<{ volume: number }>;

  /**
   * this method will get the current time of a playing audio file.
   * only works if channels == 1
   * 
   * @param options - define assetId to identify asset.
   * 
   */
  getCurrentTime(options: CommonOptions): Promise<{ time: number }>;

  /**
   * This method will set the new current time for a audio file.
   * 
   * @param  options - define assetId to identify asset, time as numerical value in seconds to set currentTime
   * 
   */
  setCurrentTime(options: TimeOptions ): Promise<void>;

  /**
   * This method will set the new current time for a audio file.
   * 
   * @param assetId - identifier of the asset
   * 
   */
  getDuration(options: CommonOptions): Promise<{ duration: number }>;

  /**
   * This method will set the new current time for a audio file.
   * 
   * @param assetId - identifier of the asset
   * 
   */
  addListener(event: string, callback: (info: { status: StatusEvent; position: number }) => void): PluginListenerHandle;
}

export interface ConfigureOptions {
  fade?: boolean;
}

export interface PreloadOptions {
  /**
   * Relative path of the file or absolute url (file://).
   * @since 1.0.0
   */
  assetPath: string;
  /**
   * Unique identifier of the file.
   * @since 1.0.0
   */
  assetId: string;
  /**
   * Volume.
   * @since 1.0.0
   */
  volume?: number;
  /**
   * Number of audio channels.
   * @since 1.0.0
   */
  audioChannelNum?: number;
  /**
   * Pass true if assetPath is a `file://` url
   * @since 1.0.0
   */
  isUrl?: boolean;
  /**
   * Title of the track; string, MANDTORY, default ''.
   * @since 1.0.0
   */
  trackName: string; 
  /**
   * String, optional, default ''.
   * @since 1.0.0
   */
  artist?: string;
  /**
   * String, optional, default ''.
   * @since 1.0.0
   */
  album?: string;
  /**
   * String, optional, can be a local path (use fullpath 'file:///storage/emulated/...', or only 'my_image.jpg' if my_image.jpg is in the www folder of your app) or a remote url ('http://...', 'https://...', 'ftp://...'),
   * @since 1.0.0
   */
  cover?: string;
  /**
   * Show previous button, optional, default: true.
   * @since 1.0.0
   */
  hasPrev?: boolean;
  /**
   * Show next button, optional, default: true.
   * @since 1.0.0
   */
  hasNext?: boolean;
  /**
   * Show close button, optional, default: false.
   * @since 1.0.0
   */
  hasClose?: boolean;
  /**
   * Number, optional, default: 0, iOS ONLY.
   * @since 1.0.0
   */
  duration?: number;
  /**
   * Number, optional, default: 0, iOS ONLY.
   * @since 1.0.0
   */
  elapsed?: number;
  /**
   * Boolean, optional, default: false. true value overrides hasNext, iOS ONLY.
   * @since 1.0.0
   */
  hasSkipForward?: boolean;
  /**
   * Boolean, optional, default: false. true value overrides hasPrev, iOS ONLY.
   * @since 1.0.0
   */
  hasSkipBackward?: boolean;
  /**
   * Number, optional. default: 15, iOS ONLY.
   * @since 1.0.0
   */
  skipForwardInterval?: number;
  /**
   * Number, optional. default: 15, iOS ONLY.
   * @since 1.0.0
   */
  skipBackwardInterval?: number;
  /**
   * Boolean, optional. default to false. Enable scrubbing from control center progress bar, iOS ONLY.
   * @since 1.0.0
   */
  hasScrubbing?: boolean;
  /**
   * Boolean, optional, default : true, ANDROID ONLY.
   * @since 1.0.0
   */
  isPlaying?: boolean;
  /**
   * Boolean, optional, default : false, ANDROID ONLY.
   * @since 1.0.0
   */
  dismissable?: boolean;
  /**
   * String, text displayed in the status bar when the notification (and the ticker) are updated, ANDROID ONLY.
   * @since 1.0.0
   */
  ticker?: string;
  /**
   * 'media_play',A ll icons default to their built-in android equivalents, The supplied drawable name, e.g. 'media_play', is the name of a drawable found under android/res/drawable folders.
   * @since 1.0.0
   */
  playIcon?: string;
  /**
   * 'media_pause', ANDROID ONLY.
   * @since 1.0.0
   */
  pauseIcon?: string;
  /**
   * 'media_prev', ANDROID ONLY
   * @since 1.0.0
   */
  prevIcon?: string;
  /**
   * 'media_next', ANDROID ONLY
   * @since 1.0.0
   */
  nextIcon?: string;
  /**
   * 'media_close', ANDROID ONLY
   * @since 1.0.0
   */
  closeIcon?: string;
  /**
   * 'notification', ANDROID ONLY
   * @since 1.0.0
   */
  notificationIcon?: string;
}

export interface PlayOptions {
  /**
   * Identifier of the asset.
   * @since 1.0.0
   */
  assetId: string;
  /**
   * (optional) play with seek. example: 6.0 - start playing track from 6 sec
   * @since 1.0.0
   */
  time: number;
}

export interface CommonOptions {
  /**
   * Identifier of the asset.
   * @since 1.0.0
   */
   assetId: string;
}

export interface VolumeOptions { 
  /**
   * Identifier of the asset.
   * @since 1.0.0
   */
  assetId: string; 
  /**
   * Numerical value of the volume between 0 - 1.0
   * @since 1.0.0
   */
  volume: number;
}

export interface TimeOptions {
  /**
   * Identifier of the asset.
   * @since 1.0.0
   */
  assetId: string;
  /**
   * Numerical value in seconds
   * @since 1.0.0
   */
  time: number; 
}

export enum StatusEvent {
   NONE = 'NONE',

  /**
   * emitted when track is stopped
   *
   * @since 1.0.0
   */
   STOPPED = 'STOPPED',

  /**
   * emitted every second if track is playing
   *
   * @since 1.0.0
   */
   PLAYING = 'PLAYING', 

  /**
   * emitted when track is on buffering
   *
   * @since 1.0.0
   */
  BUFFERING = 'BUFFERING', 

  /**
   * emitted when track is pausesd
   *
   * @since 1.0.0
   */
  PAUSED = 'PAUSED', 
  
  /**
   * emitted after an error
   *
   * @since 1.0.0
   */
  ERROR = 'ERROR',

  CONNECTING = 'CONNECTING',
  OTHER = 'OTHER'
}