<script lang="ts" setup>
const { path } = useRoute();

const { data } = await useAsyncData(`content-${path}`, () => {
  return queryContent()
    .where({ _path: path === '/' ? '/intro' : path })
    .findOne();
});
</script>

<template>
  <div class="wrapper">
    <ContentRenderer v-if="data" :value="data" />
  </div>
</template>

<style lang="scss">
.wrapper {
  height: 100%;
  padding: 10px;
  max-width: 920px;
  margin: 0 auto;
}
</style>
