<script lang="ts" setup>
const nuxtApp = useNuxtApp();

const drawer = ref<boolean>(false);

const loading = ref<boolean>(false);

const ulgtu = ref([
  {
    title: '09.04.01_IVT',
    value: [
      {
        title: '1. Дискретная математика, математическая логика и теория алгоритмов',
        value: '/ivt/1'
      },
      {
        title: '2. Методы оптимизации',
        value: '/ivt/2'
      },
      {
        title: '3. Теория принятия решений',
        value: '/ivt/3'
      },
      {
        title: '4. Теоритические основы информационных технологий',
        value: '/ivt/4'
      },
      {
        title: '5. Интерактивная компьютерная графика',
        value: '/ivt/5'
      },
      {
        title: '6. Программирование',
        value: '/ivt/6'
      },
      {
        title: '7. Технология разработки программного обеспечения',
        value: '/ivt/7'
      },
      {
        title: '8. Организация и архитектура ЭВМ и вычислительных систем',
        value: '/ivt/8'
      },
      {
        title: '9. Операционные системы, оболочки и среды',
        value: '/ivt/9'
      },
      {
        title: '10. Системы управления базами данных',
        value: '/ivt/10'
      },
      {
        title: '11. Сети ЭВМ и телекоммуникации',
        value: '/ivt/11'
      },
      {
        title: '12. Информационная безопасность',
        value: '/ivt/12'
      },
      {
        title: '13. Теория вычислительных процессов, языков программирования и методы трансляции',
        value: '/ivt/13'
      },
      {
        title: '14. Системы искусственного интеллекта',
        value: '/ivt/14'
      }
    ]
  },
  {
    title: '09.04.03_PI',
    value: [
      {
        title: '1. Математическая логика и теория алгоритмов',
        value: '/pi/1'
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
        value: '/prolog/1'
      }
    ]
  },
  {
    title: 'neyronki',
    value: [
      {
        title: 'neyronki',
        value: '/neyronki/1'
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

  <v-navigation-drawer v-model="drawer" rail rail-width="450" location="left">
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
