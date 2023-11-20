<template>
  <v-app dark>
    <v-main>
      <nuxt />
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style scoped>
@media (max-width: 900px) {
  .HeadMarkText {
    font-size: 20px;
  }
}

@media (max-width: 600px) {
  .HeadMarkText {
    font-size: 16px;
  }
}

@media (max-width: 400px) {
  .HeadMarkText {
    font-size: 10px;
  }
}
</style>
