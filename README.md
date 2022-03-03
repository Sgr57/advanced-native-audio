# advanced-native-audio

An advanced native plugin for native audio engine

## Install

```bash
npm install advanced-native-audio
npx cap sync
```

## API

<docgen-index>

* [`configure(...)`](#configure)
* [`preload(...)`](#preload)
* [`play(...)`](#play)
* [`resume(...)`](#resume)
* [`pause(...)`](#pause)
* [`loop(...)`](#loop)
* [`stop(...)`](#stop)
* [`unload(...)`](#unload)
* [`setVolume(...)`](#setvolume)
* [`getVolume(...)`](#getvolume)
* [`getCurrentTime(...)`](#getcurrenttime)
* [`setCurrentTime(...)`](#setcurrenttime)
* [`getDuration(...)`](#getduration)
* [`addListener(...)`](#addlistener)
* [Interfaces](#interfaces)
* [Enums](#enums)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### configure(...)

```typescript
configure(options: ConfigureOptions) => any
```

| Param         | Type                                                          |
| ------------- | ------------------------------------------------------------- |
| **`options`** | <code><a href="#configureoptions">ConfigureOptions</a></code> |

**Returns:** <code>any</code>

--------------------


### preload(...)

```typescript
preload(options: PreloadOptions) => any
```

This method will load more optimized audio files for background into memory.

| Param         | Type                                                      | Description                                                    |
| ------------- | --------------------------------------------------------- | -------------------------------------------------------------- |
| **`options`** | <code><a href="#preloadoptions">PreloadOptions</a></code> | - Options that describes the behaviour of the player and track |

**Returns:** <code>any</code>

**Since:** 1.0.0

--------------------


### play(...)

```typescript
play(options: PlayOptions) => any
```

This method will play the loaded audio file if present in the memory.

| Param         | Type                                                | Description                                               |
| ------------- | --------------------------------------------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#playoptions">PlayOptions</a></code> | - define assetId to identify asset, set time to add seek. |

**Returns:** <code>any</code>

--------------------


### resume(...)

```typescript
resume(options: CommonOptions) => any
```

This method will resume the loaded audio file if it's currently in pause.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### pause(...)

```typescript
pause(options: CommonOptions) => any
```

This method will pause the loaded audio file if it's currently playing.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### loop(...)

```typescript
loop(options: CommonOptions) => any
```

This method will loop the audio file for playback.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### stop(...)

```typescript
stop(options: CommonOptions) => any
```

This method will stop the audio file if it's currently playing.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### unload(...)

```typescript
unload(options: CommonOptions) => any
```

This method will unload the audio file from the memory.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### setVolume(...)

```typescript
setVolume(options: VolumeOptions) => any
```

This method will set the new volume for a audio file.

| Param         | Type                                                    | Description                                                                                     |
| ------------- | ------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#volumeoptions">VolumeOptions</a></code> | - define assetId to identify asset, volume to set numerical value of the volume between 0 - 1.0 |

**Returns:** <code>any</code>

--------------------


### getVolume(...)

```typescript
getVolume(options: CommonOptions) => any
```

This method will get the current volume for a audio file.

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### getCurrentTime(...)

```typescript
getCurrentTime(options: CommonOptions) => any
```

this method will get the current time of a playing audio file.
only works if channels == 1

| Param         | Type                                                    | Description                         |
| ------------- | ------------------------------------------------------- | ----------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> | - define assetId to identify asset. |

**Returns:** <code>any</code>

--------------------


### setCurrentTime(...)

```typescript
setCurrentTime(options: TimeOptions) => any
```

This method will set the new current time for a audio file.

| Param         | Type                                                | Description                                                                               |
| ------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| **`options`** | <code><a href="#timeoptions">TimeOptions</a></code> | - define assetId to identify asset, time as numerical value in seconds to set currentTime |

**Returns:** <code>any</code>

--------------------


### getDuration(...)

```typescript
getDuration(options: CommonOptions) => any
```

This method will set the new current time for a audio file.

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#commonoptions">CommonOptions</a></code> |

**Returns:** <code>any</code>

--------------------


### addListener(...)

```typescript
addListener(event: string, callback: (info: { status: StatusEvent; position: number; }) => void) => PluginListenerHandle
```

This method will set the new current time for a audio file.

| Param          | Type                                                                                                  |
| -------------- | ----------------------------------------------------------------------------------------------------- |
| **`event`**    | <code>string</code>                                                                                   |
| **`callback`** | <code>(info: { status: <a href="#statusevent">StatusEvent</a>; position: number; }) =&gt; void</code> |

**Returns:** <code><a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### Interfaces


#### ConfigureOptions

| Prop       | Type                 |
| ---------- | -------------------- |
| **`fade`** | <code>boolean</code> |


#### PreloadOptions

| Prop                       | Type                 | Description                                                                                                                                                                                                              | Since |
| -------------------------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----- |
| **`assetPath`**            | <code>string</code>  | Relative path of the file or absolute url (file://).                                                                                                                                                                     | 1.0.0 |
| **`assetId`**              | <code>string</code>  | Unique identifier of the file.                                                                                                                                                                                           | 1.0.0 |
| **`volume`**               | <code>number</code>  | Volume.                                                                                                                                                                                                                  | 1.0.0 |
| **`audioChannelNum`**      | <code>number</code>  | Number of audio channels.                                                                                                                                                                                                | 1.0.0 |
| **`isUrl`**                | <code>boolean</code> | Pass true if assetPath is a `file://` url                                                                                                                                                                                | 1.0.0 |
| **`trackName`**            | <code>string</code>  | Title of the track; string, MANDTORY, default ''.                                                                                                                                                                        | 1.0.0 |
| **`artist`**               | <code>string</code>  | String, optional, default ''.                                                                                                                                                                                            | 1.0.0 |
| **`album`**                | <code>string</code>  | String, optional, default ''.                                                                                                                                                                                            | 1.0.0 |
| **`cover`**                | <code>string</code>  | String, optional, can be a local path (use fullpath 'file:///storage/emulated/...', or only 'my_image.jpg' if my_image.jpg is in the www folder of your app) or a remote url ('http://...', 'https://...', 'ftp://...'), | 1.0.0 |
| **`hasPrev`**              | <code>boolean</code> | Show previous button, optional, default: true.                                                                                                                                                                           | 1.0.0 |
| **`hasNext`**              | <code>boolean</code> | Show next button, optional, default: true.                                                                                                                                                                               | 1.0.0 |
| **`hasClose`**             | <code>boolean</code> | Show close button, optional, default: false.                                                                                                                                                                             | 1.0.0 |
| **`duration`**             | <code>number</code>  | Number, optional, default: 0, iOS ONLY.                                                                                                                                                                                  | 1.0.0 |
| **`elapsed`**              | <code>number</code>  | Number, optional, default: 0, iOS ONLY.                                                                                                                                                                                  | 1.0.0 |
| **`hasSkipForward`**       | <code>boolean</code> | Boolean, optional, default: false. true value overrides hasNext, iOS ONLY.                                                                                                                                               | 1.0.0 |
| **`hasSkipBackward`**      | <code>boolean</code> | Boolean, optional, default: false. true value overrides hasPrev, iOS ONLY.                                                                                                                                               | 1.0.0 |
| **`skipForwardInterval`**  | <code>number</code>  | Number, optional. default: 15, iOS ONLY.                                                                                                                                                                                 | 1.0.0 |
| **`skipBackwardInterval`** | <code>number</code>  | Number, optional. default: 15, iOS ONLY.                                                                                                                                                                                 | 1.0.0 |
| **`hasScrubbing`**         | <code>boolean</code> | Boolean, optional. default to false. Enable scrubbing from control center progress bar, iOS ONLY.                                                                                                                        | 1.0.0 |
| **`isPlaying`**            | <code>boolean</code> | Boolean, optional, default : true, ANDROID ONLY.                                                                                                                                                                         | 1.0.0 |
| **`dismissable`**          | <code>boolean</code> | Boolean, optional, default : false, ANDROID ONLY.                                                                                                                                                                        | 1.0.0 |
| **`ticker`**               | <code>string</code>  | String, text displayed in the status bar when the notification (and the ticker) are updated, ANDROID ONLY.                                                                                                               | 1.0.0 |
| **`playIcon`**             | <code>string</code>  | 'media_play',A ll icons default to their built-in android equivalents, The supplied drawable name, e.g. 'media_play', is the name of a drawable found under android/res/drawable folders.                                | 1.0.0 |
| **`pauseIcon`**            | <code>string</code>  | 'media_pause', ANDROID ONLY.                                                                                                                                                                                             | 1.0.0 |
| **`prevIcon`**             | <code>string</code>  | 'media_prev', ANDROID ONLY                                                                                                                                                                                               | 1.0.0 |
| **`nextIcon`**             | <code>string</code>  | 'media_next', ANDROID ONLY                                                                                                                                                                                               | 1.0.0 |
| **`closeIcon`**            | <code>string</code>  | 'media_close', ANDROID ONLY                                                                                                                                                                                              | 1.0.0 |
| **`notificationIcon`**     | <code>string</code>  | 'notification', ANDROID ONLY                                                                                                                                                                                             | 1.0.0 |


#### PlayOptions

| Prop          | Type                | Description                                                              | Since |
| ------------- | ------------------- | ------------------------------------------------------------------------ | ----- |
| **`assetId`** | <code>string</code> | Identifier of the asset.                                                 | 1.0.0 |
| **`time`**    | <code>number</code> | (optional) play with seek. example: 6.0 - start playing track from 6 sec | 1.0.0 |


#### CommonOptions

| Prop          | Type                | Description              | Since |
| ------------- | ------------------- | ------------------------ | ----- |
| **`assetId`** | <code>string</code> | Identifier of the asset. | 1.0.0 |


#### VolumeOptions

| Prop          | Type                | Description                                   | Since |
| ------------- | ------------------- | --------------------------------------------- | ----- |
| **`assetId`** | <code>string</code> | Identifier of the asset.                      | 1.0.0 |
| **`volume`**  | <code>number</code> | Numerical value of the volume between 0 - 1.0 | 1.0.0 |


#### TimeOptions

| Prop          | Type                | Description                | Since |
| ------------- | ------------------- | -------------------------- | ----- |
| **`assetId`** | <code>string</code> | Identifier of the asset.   | 1.0.0 |
| **`time`**    | <code>number</code> | Numerical value in seconds | 1.0.0 |


#### PluginListenerHandle

| Prop         | Type                      |
| ------------ | ------------------------- |
| **`remove`** | <code>() =&gt; any</code> |


### Enums


#### StatusEvent

| Members          | Value                     | Description                              | Since |
| ---------------- | ------------------------- | ---------------------------------------- | ----- |
| **`NONE`**       | <code>'NONE'</code>       |                                          |       |
| **`STOPPED`**    | <code>'STOPPED'</code>    | emitted when track is stopped            | 1.0.0 |
| **`PLAYING`**    | <code>'PLAYING'</code>    | emitted every second if track is playing | 1.0.0 |
| **`BUFFERING`**  | <code>'BUFFERING'</code>  | emitted when track is on buffering       | 1.0.0 |
| **`PAUSED`**     | <code>'PAUSED'</code>     | emitted when track is pausesd            | 1.0.0 |
| **`ERROR`**      | <code>'ERROR'</code>      | emitted after an error                   | 1.0.0 |
| **`CONNECTING`** | <code>'CONNECTING'</code> |                                          |       |
| **`OTHER`**      | <code>'OTHER'</code>      |                                          |       |

</docgen-api>
