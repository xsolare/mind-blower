<script lang="ts" setup>
import type { AppConfigInput } from 'nuxt/schema';

import UiModal from '#/components/common/modal/ui-modal.vue';
import UiSnackbar from '#/components/common/snackbar/ui-snackbar.vue';

const colorMode = useColorMode();
const app = useAppConfig() as AppConfigInput;
useHead({
  title: app.name,
  htmlAttrs: { lang: 'ru' },
  titleTemplate: '%s',
  meta: [
    { name: 'viewport', content: 'width=device-width, initial-scale=1' },
    {
      hid: 'description',
      name: 'description',
      content: 'GGD'
    }
  ],
  link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
});
</script>

<template>
  <ClientOnly>
    <v-theme-provider :theme="colorMode.preference">
      <v-app>
        <v-main>
          <NuxtLayout>
            <NuxtLoadingIndicator :height="5" :duration="3000" :throttle="400" />
            <NuxtPage />
          </NuxtLayout>

          <v-no-ssr>
            <ui-snackbar />
            <ui-modal />
          </v-no-ssr>
        </v-main>
      </v-app>
    </v-theme-provider>
  </ClientOnly>
</template>

<style lang="scss">
.v-card-item__content {
  overflow: visible;
}

.v-main {
  min-height: 100vh;
  background-color: var(--bg-primary);

  ::-webkit-scrollbar {
    width: 8px;
    height: 100%;
    background-color: #dbdbdb;
  }

  ::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background-color: #a9a9bb;
    box-shadow: inset 0 0 5px #a9a9bb;
  }

  ::-webkit-scrollbar-track {
    background-color: transparent;
  }
}

.v-navigation-drawer {
  ::-webkit-scrollbar {
    width: 4px;
    height: 100%;
    background-color: var(--bg-secondary);
  }

  ::-webkit-scrollbar-thumb {
    border-radius: 10px;
    background-color: #625e7e;
    box-shadow: inset 0 0 5px #625e7e;
  }

  ::-webkit-scrollbar-track {
    background-color: transparent;
  }
}
</style>
