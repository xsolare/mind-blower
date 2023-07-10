<script lang="ts" setup />

<template>
  <not-found title="Ничего не найдено!" />
  <div class="page-not-found">
    <NuxtLink to="/dashboard">
      <v-btn variant="elevated" color="primary" size="x-large">На главную</v-btn>
    </NuxtLink>
  </div>
</template>

<style lang="scss" scoped>
.page-not-found {
  margin-top: 25px;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
