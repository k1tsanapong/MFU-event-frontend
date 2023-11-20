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

          <v-col cols="8" sm="4" id="h_upload">
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
          </v-col>

          <v-col cols="2" sm="4"></v-col>
        </v-row>

        <v-form @submit.prevent="submit">
          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Title</div>
            </v-col>
            <v-col cols="12">
              <v-text-field outlined></v-text-field>
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
                v-model="selcetSchool"
              ></v-autocomplete>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Where</div>
            </v-col>
            <v-col cols="12">
              <v-text-field outlined></v-text-field>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Time</div>
            </v-col>
            <v-col cols="12">
              <v-datetime-picker label="Select Datetime" v-model="datetime">
              </v-datetime-picker>
            </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Description</div>
            </v-col>
            <v-col cols="12"> <v-textarea outlined></v-textarea> </v-col>
          </v-row>

          <v-row class="d-flex flex-column" no-gutters>
            <v-col cols="12">
              <div class="text-h5 font-weight-regular">Tags</div>
            </v-col>
            <v-col cols="12">
              <v-autocomplete
                outlined
                :items="tags"
                v-model="selcetTags"
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
              <v-text-field outlined></v-text-field>
            </v-col>
          </v-row>

          <v-row justify="center">
            <v-col cols="2">
              <v-card @click="createNewOne" color="#E8B71A" rounded="pill" class="pa-3" >

                      <div class="text-center font-weight-bold text-h4">
                        Create
                    </div>

              </v-card>
            </v-col>
          </v-row>
        </v-form>

        <v-overlay
          z-index="0"
          :value="scan_overlay"
          opacity="0.1"
          style="cursor: pointer"
        >
          <v-card
            v-click-outside="onClickOutside"
            z-index="2"
            color="white"
            class="d-flex align-center"
            style="cursor: default"
          >
            <v-container>
              <StreamBarcodeReader
                ref="scanner"
                @decode="onDecode"
                @loaded="onLoaded"
              ></StreamBarcodeReader>
            </v-container>
          </v-card>
        </v-overlay>
      </v-container>
    </v-col>

    <v-col class="d-flex justify-center align-end" cols="1"> </v-col>
  </v-row>
</template>

<script>
export default {
  name: "imageUpload",
  data() {
    return {
      datetime: null,

      selcetTags: null,

      tags: [
        "Blushing",
        "Comedy",
        "Drugs",
        "Dubious consent",
        "Ecchi",
        "Harem",
        "NSFW",
        "School girl",
        "Yuri",
      ],
      schools: ["Death", "Day"],

      selcetSchool: null,

      scan_overlay: false,

      previewImage: null,
      image: null,
      show: true,
    };
  },
  methods: {
    uploadImage(e) {
      this.image = e.target.files[0];

      const reader = new FileReader();

      reader.readAsDataURL(this.image);
      reader.onload = (e) => {
        this.previewImage = e.target.result;
        console.log(this.previewImage);
      };

      this.show = false;
    },

    submit() {
      const formData = new FormData();
      formData.append("product_img", this.image);
      formData.append("product_name", this.product_name);
      formData.append("product_detail", this.product_detail);
      formData.append("critical", this.critical);
      formData.append("min", this.min);
      formData.append("max", this.max);
      formData.append("barcode", this.barcode);

      this.$axios.$post("/products/upload", formData).then((res) => {
        this.$router.push("/stock");
        console.log(res);
      });
    },

    onScan() {
      this.scan_overlay = true;
    },

    onClickOutside() {
      this.scan_overlay = false;
      this.$refs.scanner.codeReader.stream
        .getTracks()
        .forEach(function (track) {
          track.stop();
        });
    },

    onDecode(text) {
      console.log(`Decode text from QR code is ${text}`);

      this.barcode = text;
      this.scan_overlay = false;
      this.$refs.scanner.codeReader.stream
        .getTracks()
        .forEach(function (track) {
          track.stop();
        });
    },
    onLoaded() {
      console.log(`Ready to start scanning barcodes`);
    },

    createNewOne()
    {
        console.log(`TEsts`);

    }
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
