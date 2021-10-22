import { registerPlugin } from '@capacitor/core';

import type { AdvancedNativeAudioPlugin } from './definitions';

const AdvancedNativeAudio = registerPlugin<AdvancedNativeAudioPlugin>(
  'AdvancedNativeAudio',
  {
    web: () => import('./web').then(m => new m.AdvancedNativeAudioWeb()),
  },
);

export * from './definitions';
export { AdvancedNativeAudio };
