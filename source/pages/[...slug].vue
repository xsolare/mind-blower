<script lang="ts" setup>
const { path } = useRoute();

console.log('?', path);

const { data } = await useAsyncData('content-neyronki', () => {
  return queryContent().where({ _path: path }).findOne();
});
</script>

<template>
  <main>
    <ContentRenderer v-if="data" :value="data" />
  </main>
</template>

<style lang="scss">
main {
  padding: 10px;
  max-width: 920px;
  margin: 0 auto;
}
</style>
