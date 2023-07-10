<script lang="ts" setup>
const nuxtApp = useNuxtApp();

const drawer = ref<boolean>(false);

const loading = ref<boolean>(false);

const ulgtu = ref([
  {
    title: '09.04.01_IVT',
    value: [
      {
        title: '1',
        value: 'ivt-1'
      },
      {
        title: '2',
        value: 'ivt-2'
      },
      {
        title: '3',
        value: 'ivt-3'
      },
      {
        title: '4',
        value: 'ivt-4'
      },
      {
        title: '5',
        value: 'ivt-5'
      },
      {
        title: '6',
        value: 'ivt-6'
      },
      {
        title: '7',
        value: 'ivt-7'
      },
      {
        title: '8',
        value: 'ivt-8'
      },
      {
        title: '9',
        value: 'ivt-9'
      },
      {
        title: '10',
        value: 'ivt-10'
      },
      {
        title: '11',
        value: 'ivt-11'
      },
      {
        title: '12',
        value: 'ivt-12'
      },
      {
        title: '13',
        value: 'ivt-13'
      },
      {
        title: '14',
        value: 'ivt-14'
      }
    ]
  }
]);

const iatu = ref([
  {
    title: 'prolog',
    value: [
      {
        title: 'prolog',
        value: 'prolog'
      }
    ]
  },
  {
    title: 'neyronki',
    value: [
      {
        title: 'neyronki',
        value: 'neyronki'
      }
    ]
  }
]);

const items = ref([
  { title: 'ulgtu', value: ulgtu },
  { title: 'iatu', value: iatu }
]);

nuxtApp.hook('page:start', () => {
  loading.value = true;
});
nuxtApp.hook('page:finish', () => {
  loading.value = false;
});
</script>

<template>
  <v-app-bar color="primary" prominent>
    <v-app-bar-nav-icon variant="text" @click.stop="drawer = !drawer" />
    <v-toolbar-title>I really wanna die</v-toolbar-title>
    <!-- <v-spacer /> -->
    <!-- <v-btn variant="text" icon="mdi-magnify" /> -->
    <!-- <v-btn variant="text" icon="mdi-filter" /> -->
    <!-- <v-btn variant="text" icon="mdi-dots-vertical" /> -->
  </v-app-bar>

  <v-navigation-drawer v-model="drawer" location="left">
    <v-list>
      <v-list-group v-for="item in items" :key="item.value" :value="item.title">
        <template #activator="{ props }">
          <v-list-item v-bind="props" :value="item.value" :title="item.title" />
        </template>

        <v-list-group v-for="{ title, value } in item.value" :key="value" :value="value">
          <template #activator="{ props }">
            <v-list-item v-bind="props" :title="title" />
          </template>

          <v-list-item
            v-for="(v, i) in value"
            :key="i"
            :title="v.title"
            :value="v.value"
            @click="navigateTo(v.value)" />
        </v-list-group>
      </v-list-group>
    </v-list>
  </v-navigation-drawer>

  <slot />
</template>

<style lang="scss" scoped></style>
