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

| Param         | Type                                                      |
| ------------- | --------------------------------------------------------- |
| **`options`** | <code><a href="#preloadoptions">PreloadOptions</a></code> |

**Returns:** <code>any</code>

--------------------


### play(...)

```typescript
play(options: { assetId: string; time: number; }) => any
```

| Param         | Type                                            |
| ------------- | ----------------------------------------------- |
| **`options`** | <code>{ assetId: string; time: number; }</code> |

**Returns:** <code>any</code>

--------------------


### resume(...)

```typescript
resume(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### pause(...)

```typescript
pause(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### loop(...)

```typescript
loop(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### stop(...)

```typescript
stop(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### unload(...)

```typescript
unload(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### setVolume(...)

```typescript
setVolume(options: { assetId: string; volume: number; }) => any
```

| Param         | Type                                              |
| ------------- | ------------------------------------------------- |
| **`options`** | <code>{ assetId: string; volume: number; }</code> |

**Returns:** <code>any</code>

--------------------


### getVolume(...)

```typescript
getVolume(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### getCurrentTime(...)

```typescript
getCurrentTime(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### setCurrentTime(...)

```typescript
setCurrentTime(options: { assetId: string; time: number; }) => any
```

| Param         | Type                                            |
| ------------- | ----------------------------------------------- |
| **`options`** | <code>{ assetId: string; time: number; }</code> |

**Returns:** <code>any</code>

--------------------


### getDuration(...)

```typescript
getDuration(options: { assetId: string; }) => any
```

| Param         | Type                              |
| ------------- | --------------------------------- |
| **`options`** | <code>{ assetId: string; }</code> |

**Returns:** <code>any</code>

--------------------


### addListener(...)

```typescript
addListener(event: string, callback: (info: { status: any; position: number; }) => void) => PluginListenerHandle
```

| Param          | Type                                                               |
| -------------- | ------------------------------------------------------------------ |
| **`event`**    | <code>string</code>                                                |
| **`callback`** | <code>(info: { status: any; position: number; }) =&gt; void</code> |

**Returns:** <code><a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### Interfaces


#### ConfigureOptions

| Prop       | Type                 |
| ---------- | -------------------- |
| **`fade`** | <code>boolean</code> |


#### PreloadOptions

| Prop                       | Type                 |
| -------------------------- | -------------------- |
| **`assetPath`**            | <code>string</code>  |
| **`assetId`**              | <code>string</code>  |
| **`volume`**               | <code>number</code>  |
| **`audioChannelNum`**      | <code>number</code>  |
| **`isUrl`**                | <code>boolean</code> |
| **`trackName`**            | <code>string</code>  |
| **`artist`**               | <code>string</code>  |
| **`album`**                | <code>string</code>  |
| **`cover`**                | <code>string</code>  |
| **`hasPrev`**              | <code>boolean</code> |
| **`hasNext`**              | <code>boolean</code> |
| **`hasClose`**             | <code>boolean</code> |
| **`duration`**             | <code>number</code>  |
| **`elapsed`**              | <code>number</code>  |
| **`hasSkipForward`**       | <code>boolean</code> |
| **`hasSkipBackward`**      | <code>boolean</code> |
| **`skipForwardInterval`**  | <code>number</code>  |
| **`skipBackwardInterval`** | <code>number</code>  |
| **`hasScrubbing`**         | <code>boolean</code> |
| **`isPlaying`**            | <code>boolean</code> |
| **`dismissible`**          | <code>boolean</code> |
| **`ticker`**               | <code>string</code>  |
| **`playIcon`**             | <code>string</code>  |
| **`pauseIcon`**            | <code>string</code>  |
| **`prevIcon`**             | <code>string</code>  |
| **`nextIcon`**             | <code>string</code>  |
| **`closeIcon`**            | <code>string</code>  |
| **`notificationIcon`**     | <code>string</code>  |


#### PluginListenerHandle

| Prop         | Type                      |
| ------------ | ------------------------- |
| **`remove`** | <code>() =&gt; any</code> |

</docgen-api>
