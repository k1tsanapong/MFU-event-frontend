import { createVuetify} from 'vuetify'
<template>
  <div>

    <div>
      <v-container class="search-container" fluid>
        <v-row justify="center" align="center">
          <v-col align="center">
            <v-text-field
              v-model="search"
              label="Search"
              class="search-text-field"
              solo
              hide-details
              rounded
              outlined
            >
              <template v-slot:append>
                <v-icon>mdi-magnify</v-icon>
              </template>
            </v-text-field>
          </v-col>

          <v-col xs="12" sm="4" md="4" lg="2">
            <v-btn large rounded @click="handleSort"
              >Sort <v-icon size="24">mdi-sort</v-icon></v-btn
            >
          </v-col>

          <v-col xs="12" sm="12" md="12" lg="12">
            <v-radio-group v-model="selectedStatus" row>
              <v-radio
                v-for="(label, value) in statusOptions"
                :key="value"
                :label="label"
                :value="value"
                color="black"
                class="mr-2"
              ></v-radio>
            </v-radio-group>
          </v-col>
        </v-row>
      </v-container>
    
      <v-container>
        <v-row>
          <v-col
            v-for="(item) in all_event"
            :key="item.id"
            cols="4"
            class="px-10"
          >
            <Event :a_event="item" />
          </v-col>
        </v-row>
      </v-container>

      <v-btn
      v-if="$auth.loggedIn"
        v-show="fab"
        fab
        dark
        fixed
        bottom
        right
        color="#8F2B31"
        size="125"
        @click="toTop"
      >
        <v-icon size="50" class="font-weight-bold">mdi-plus</v-icon>
      </v-btn>
    </div>
  </div>
</template>

<script>
import mockData from "@/static/mockData.json";

export default {
  name: "homepage",
  data() {
    return {
      fab: true, // Ensure 'fab' is defined in your data
      isLoggedIn: false,
      all_event: null,
      search: "",
      selectedStatus: null,
      statusOptions: {
        OnEvents: "Ongoing Events",
        UpEvents: "Upcoming Events",
        ExpEvents: "Expired Events",
      },
    };
  },
  inject: ["setHeader"],
  created() {
    this.setHeader("MFU EVENTS");
  },

  async fetch() {

    try {
      
      const res = await this.$axios.get("/api/events?populate=*");

      this.all_event = res.data.data;


      
    } catch (error) {
      console.log(error);
    }
  },

  methods: {
    handleSort() {
      // Add your sorting logic here
    },
    handleProfile() {
      // Handle profile click
    },
    handleLogin() {
       this.isLoggedIn = true;
       this.$router.push("/login");

    },
    toTop() {
      this.$router.push("/festival/new");
    },
  },
};
</script>

<style>
.search-container {
  background-color: #bc8e5d;
  border-radius: 50px;
  width: 60%; /* Adjust the width as needed */
  max-width: 1200px;
  margin: 30px auto;
  padding: 25px 10px 5px;
}

.search-text-field {
  font-size: 18px; /* Adjust the font size as needed */
  width: 80%;
}
.v-input--radio-group__input {
  justify-content: space-evenly;
}
.v-input--selection-controls {
  margin-top: -13px;
  padding-bottom: -15px;
}
</style>


