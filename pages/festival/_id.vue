<template>
  <v-row justify="center">
    <v-col class="d-flex justify-center align-start" cols="1">
      <nuxt-link to="/home">
        <v-icon
          style="transform: scaleX(-1); color: brown"
          class="rotate-180"
          size="120"
        >
          mdi-share-outline
        </v-icon>
      </nuxt-link>
    </v-col>

    <v-col cols="10" class="d-flex justify-center my-12">
      <v-card class="pb-12" color="#C78186" max-width="100rem" rounded="xl">
        <v-img :src="urlImg" max-height="300" />

        <div class="px-6">
          <v-row>
            <v-col cols="12">
              <div class="pt-12 pb-1 white--text font-weight-bold">
                Title: {{ event_data.attributes?.title }}
              </div>
            </v-col>
          </v-row>

          <v-row>
            <v-col cols="6">
              <div class="pt-3 pb-1 white--text font-weight-bold">
                School:
                {{ event_data.attributes?.school?.data?.attributes?.name }}
              </div>
            </v-col>

            <v-col cols="6">
              <div class="pt-3 pb-1 white--text font-weight-bold">
                Time:
                {{
                  $moment(event_data.attributes?.dateTimeStart).format(
                    "DD/MM/YYYY HH:mm"
                  )
                }}
                -
                {{
                  $moment(event_data.attributes?.dateTimeEnd).format(
                    "DD/MM/YYYY HH:mm"
                  )
                }}
              </div>
            </v-col>
          </v-row>

          <v-row>
            <v-col cols="12">
              <div class="pt-3 pb-1 white--text font-weight-bold">
                Description <br />
                {{ event_data.attributes?.description }}
              </div>
            </v-col>
          </v-row>

          <v-row>
            <v-col cols="12">
              <div class="white--text font-weight-bold">Tag</div></v-col
            >

            <v-col
              v-for="(tag, index) in event_data.attributes?.tags?.data"
              :key="index"
              cols="auto"
            >
              <v-chip :color="tag.attributes?.hexColor" label>{{
                tag.attributes?.name
              }}</v-chip>
            </v-col>
          </v-row>

          <v-row>
            <v-col cols="12">
              <div class="pt-3 pb-1 white--text font-weight-bold">
                Contact Host
                {{ event_data.attributes?.contact }}
              </div>
            </v-col>
          </v-row>
        </div>
      </v-card>
    </v-col>

    <v-col class="d-flex justify-center align-end" cols="1" >
      <v-row v-if="$auth.loggedIn">
        <v-col cols="12">
          <v-icon
            @click="deleteDialog = true"
            style="color: brown"
            class="rotate-180"
            size="120"
          >
            mdi-delete
          </v-icon>
        </v-col>

        <v-col cols="12">
          <v-icon
            @click="editDialog = true"
            style="color: gold"
            class="rotate-180"
            size="120"
          >
            mdi-square-edit-outline
          </v-icon>
        </v-col>
      </v-row>
    </v-col>

    <festival-edit :id="$route.params.id" :dialog="editDialog" @close="editDialog = false" />
    <festival-delete
    :id="$route.params.id"
      :dialog="deleteDialog"
      @close="deleteDialog = false"
    />
  </v-row>
</template>

<script>
export default {
  name: "event",
  data() {
    return {
      editDialog: false,
      deleteDialog: false,

      
      urlImg: "",

      event_data: {},
    };
  },
  inject: ["setHeader"],
  created() {
    this.setHeader();
  },

  async fetch() {
    try {
      const res = await this.$axios.get(
        `/api/events/${this.$route.params.id}?populate=*`
      );

      this.event_data = res.data.data;

      this.urlImg =
      process.env.AXIOS_URL+ 
      this.event_data.attributes?.cover?.data?.attributes?.url;

      console.log(this.event_data);
    } catch (error) {
      console.log(error);
    }
  },
  methods: {},
};
</script>
