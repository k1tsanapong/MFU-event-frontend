<template>
  <v-app dark>


    <v-app-bar
      app
      color="rgb(143, 43, 49)"
      height="200"
    >

    <v-spacer></v-spacer>
        <div class="HeadMark">
          <span class="HeadMarkText">What is MFU EVENTS?</span>
        </div>
        <v-spacer></v-spacer>

    </v-app-bar>
    <v-main>
      <nuxt />
    </v-main>

  </v-app>
</template>

<script>
export default {
  data () {
    return {
    }
  }
}
</script>

<style scoped>
@import url('typeface-montserrat');

.HeadMark {
  height: 150px;
  width: 850px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background-color: rgb(232, 183, 26);
  border-radius: 60px;


}

.HeadMarkText {
  color: black;
  font-weight: 650;
  font-family: 'Montserrat', sans-serif;
  font-size: 60px;
}
</style>
