import { resolve } from 'path';

import { readyCallback } from './utils/hooks/ready';

export default defineNuxtConfig({
  //* enable ssr for rendering
  ssr: false,

  //* auto import components
  components: [
    { path: '#/components' },
    {
      path: '#/components/common',
      pathPrefix: false
    }
  ],

  imports: {
    dirs: ['store', 'store/component', 'store/common', 'utils/helpers', 'utils/api']
  },

  build: {
    transpile: ['vuetify']
  },

  //* config vite with vuetify
  vite: {
    ssr: {
      noExternal: ['vuetify']
    },
    css: {
      preprocessorOptions: {
        scss: {
          additionalData: '@import "./assets/scss/variables.scss";'
        }
      }
    }
  },

  runtimeConfig: {
    public: {
      stand: 'NUXT_PUBLIC_STAND'
    }
  },

  //* modules
  modules: ['@nuxt/content', '@pinia/nuxt', '@nuxtjs/color-mode', '@nuxt/devtools'],

  pinia: {
    autoImports: ['storeToRefs', 'defineStore']
  },

  css: ['vuetify/styles', '@mdi/font/css/materialdesignicons.min.css', '#/assets/scss/global.scss'],

  hooks: {
    ready: readyCallback
  },

  alias: {
    '#': resolve(__dirname, '.'),
    '~': resolve(__dirname, './node_modules')
  },

  plugins: [{ src: './plugins/lazy-load.ts' }],
  vue: {
    compilerOptions: {
      directiveTransforms: {
        'lazy-load': () => ({
          props: [],
          needRuntime: true
        })
      }
    }
  },

  colorMode: {
    preference: 'light', // default value of $colorMode.preference
    fallback: 'light', // fallback value if not system preference found
    hid: 'nuxt-color-mode-script',
    globalName: '__NUXT_COLOR_MODE__',
    componentName: 'ColorScheme',
    classPrefix: '',
    classSuffix: '',
    storageKey: 'nuxt-color-mode'
  }
});
