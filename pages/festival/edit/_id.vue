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
      <v-container>
        <v-row class="my-5">
          <v-col cols="2" sm="4"></v-col>

          <!-- <v-col cols="8" sm="4" id="h_upload">
            <v-card
              outlined
              class="dropZone d-flex justify-center flex-column align-center rounded-xl"
            >
              <v-img :src="previewImage" class="uploading-image rounded-xl">
              </v-img>

              <div v-if="show">
                <v-icon size="200" class="ml-6 mt-5">
                  mdi-file-image-outline
                </v-icon>

                <v-row class="my-15 d-flex align-center justify-space-between">
                  <v-col cols="1"></v-col>
                  <v-col cols="1">
                    <v-icon large> mdi-plus </v-icon>
                  </v-col>
                  <v-col cols="1"></v-col>
                  <v-col cols="8">
                    <div class="text-h5 font-weight-regular">Add image</div>
                  </v-col>
                  <v-col cols="1"></v-col>
                </v-row>
              </div>
              <input id="upfile" type="file" @change="uploadImage" />
            </v-card>
          </v-col> -->

          <v-col cols="2" sm="4"></v-col>
        </v-row>

        <v-form @submit.prevent="submit">
          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Title</div>
            </v-col>
            <v-col cols="12">
              <v-text-field outlined v-model="editedItem.title"></v-text-field>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Description</div>
            </v-col>
            <v-col cols="12">
              <v-textarea
                outlined
                v-model="editedItem.description"
              ></v-textarea>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">School</div>
            </v-col>
            <v-col cols="12">
              <v-autocomplete
                outlined
                :items="schools"
                item-text="attributes.name"
                item-value="id"
                v-model="editedItem.school"
              ></v-autocomplete>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Where</div>
            </v-col>
            <v-col cols="12">
              <v-text-field outlined v-model="editedItem.where"></v-text-field>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Starting Time</div>
            </v-col>
            <v-col cols="12">
              <v-datetime-picker
                label="Select Datetime"
                v-model="editedItem.dateTimeStart"
              >
              </v-datetime-picker>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Ending Time</div>
            </v-col>
            <v-col cols="12">
              <v-datetime-picker
                label="Select Datetime"
                v-model="editedItem.dateTimeEnd"
              >
              </v-datetime-picker>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Limit</div>
            </v-col>
            <v-col cols="12">
              <v-text-field outlined v-model="editedItem.limit"></v-text-field>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Tags</div>
            </v-col>
            <v-col cols="12">
              <v-autocomplete
                outlined
                :items="tags"
                item-text="attributes.name"
                item-value="id"
                v-model="editedItem.tags"
                multiple
                chips
              ></v-autocomplete>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Contact Host</div>
            </v-col>
            <v-col cols="12">
              <v-text-field
                outlined
                v-model="editedItem.contact"
              ></v-text-field>
            </v-col>
          </v-row>

          <v-row justify="center">
            <v-col cols="2">
              <v-card
                @click="submit"
                color="#E8B71A"
                rounded="pill"
                class="pa-3"
              >
                <div class="text-center font-weight-bold text-h4">Update</div>
              </v-card>
            </v-col>
          </v-row>
        </v-form>
      </v-container>
    </v-col>

    <v-col class="d-flex justify-center align-end" cols="1"> </v-col>
  </v-row>
</template>

<script>
export default {
  name: "imageUpload",
  middleware: ["auth"],
  data() {
    return {
      tags: [],
      schools: [],

      previewImage: null,
      image: null,
      show: true,

      editedItem: {
        title: "",
        description: "",
        where: "",
        dateTimeStart: null,
        dateTimeEnd: null,
        limit: "",
        contact: "",
        school: "",
        tags: [],
      },

      defaultItem: {
        title: "",
        description: "",
        where: "",
        dateTimeStart: null,
        dateTimeEnd: null,
        limit: "",
        contact: "",
        school: "",
        tags: [],
      },
    };
  },

  async fetch() {
    try {
      const res1 = await this.$axios.get(`/api/schools`);

      this.schools = res1.data.data;

      const res2 = await this.$axios.get(`/api/tags`);

      this.tags = res2.data.data;

      const res = await this.$axios.get(
        `/api/events/${this.$route.params.id}?populate=*`
      );

      //   const res_format = res.data.data;

      const bufferItem = JSON.parse(JSON.stringify(res.data.data.attributes));

      this.editedItem.title = bufferItem.title;
      this.editedItem.description = bufferItem.description;
      this.editedItem.where = bufferItem.where;

      // moment(bufferItem.dateTimeStart).format("YYYY-MM-DDThh:mm:ssZ")

      this.editedItem.dateTimeStart = new Date(bufferItem.dateTimeStart);
      this.editedItem.dateTimeEnd = new Date(bufferItem.dateTimeEnd);

      console.log(bufferItem.dateTimeStart);

      this.editedItem.limit = bufferItem.limit;
      this.editedItem.contact = bufferItem.contact;

      this.editedItem.school = bufferItem.school.data.id;
      this.editedItem.tags = bufferItem.tags.data;

      this.defaultItem = JSON.parse(JSON.stringify(this.editedItem));

      console.log(this.editedItem);
    } catch (error) {
      console.log(error);
    }
  },

  methods: {
    uploadImage(e) {
      this.image = e.target.files[0];

      const reader = new FileReader();

      reader.readAsDataURL(this.image);
      reader.onload = (e) => {
        this.previewImage = e.target.result;
      };

      this.show = false;
    },

    async submit() {
      try {
        const formData = new FormData();

        formData.append(
          "data",
          JSON.stringify(this.editedItem)
        );

        const res = await this.$axios.put(
          "/api/events/" + this.$route.params.id,
          formData
        );
        console.log(res);
      } catch (error) {
        console.log(error);
      }
    },
  },
}; // missing closure added
</script>

<style>
.dropZone input {
  position: absolute;
  cursor: pointer;
  top: 0px;
  right: 0;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
}

.uploading-image {
  display: flex;
}
</style>
