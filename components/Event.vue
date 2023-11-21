<template>
  <v-card color="#C78186" :to="'/festival/'+a_event.id" rounded="xxl">
    <div class="mb-3">
      <v-img :src="urlImg" height="300" style="border-top-right-radius: 20px; border-top-left-radius: 20px;  object-fit: cover;"> </v-img>

      <div class="pt-3 pb-1 px-3 white--text">{{ a_event.attributes.title }}</div>
      <div class="pt-3 pb-1 px-3 white--text">School of {{ a_event.attributes.school.data.attributes.name }}</div>

      <div class="pt-3 pb-1 px-3 white--text">Time : {{   $moment(a_event.attributes.dateTimeStart ).format("DD-MM-YYYY") }} : {{   $moment(a_event.attributes.dateTimeStart ).format("hh:mm") }}</div>

      <div class="pt-3 pb-1 px-3 white--text">{{ a_event.attributes.limit }}</div>
    </div>

    <v-card color="#D9D9D9" >
      <div
        class="pt-3 pb-1 px-3 black--text d-flex justify-center align-center"
      >
        More details
        <v-icon class="black--text pl-1 my-2">mdi-format-align-left</v-icon>
      </div>
    </v-card>
  </v-card>
</template>

<script>
export default {
  name: "event",
  props: ["a_event"],

  data() {
    return {
      urlImg: "",
    };
  },

  created() {
    this.urlImg = process.env.AXIOS_URL+this.a_event.attributes.cover.data?.attributes?.url;
  },
};
</script>
