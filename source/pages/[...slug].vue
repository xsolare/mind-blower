<script lang="ts" setup>
const { path } = useRoute();

const { data } = await useAsyncData('content-neyronki', () => {
  return queryContent().where({ _path: path }).findOne();
});
</script>

<template>
  <div class="wrapper">
    <ContentRenderer v-if="data" :value="data" />
  </div>
</template>

<style lang="scss">
.wrapper {
  padding: 10px;
  max-width: 920px;
  margin: 0 auto;
}
</style>
