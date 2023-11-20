import { createVuetify} from 'vuetify'
<template>
  <div>
    <v-app-bar app color="rgb(143, 43, 49)" height="170%">
      <nuxt-link to="/">
        <img src="/mfueventlogo.png" alt="eventLogo" class="logoevent" />
      </nuxt-link>
      <v-card class="headcard">
        <v-card-text>
          <p class="HeadMarkText">MFU EVENTS</p>
        </v-card-text>
      </v-card>
      <v-menu offset-y bottom transition="slide-x-reverse-transition">
        <template v-slot:activator="{ on }">
          <v-icon
            style="color: white; cursor: pointer;"
            size="70"
            v-on="on"
          >
            mdi-account-tie
          </v-icon>
        </template>
        <v-list style="width: 300px; overflow-y: auto;">
          <v-list-item v-on:click="handleProfile">
            <v-list-item-title>Profile</v-list-item-title>
          </v-list-item>
          <v-list-item  v-if="!isLoggedIn" v-on:click="handleLogin">
            <v-list-item-title>Login</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>
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
            v-for="(item, i) in all_event"
            :key="item.id"
            cols="4"
            class="px-10"
          >
            <Event :a_event="item" />
          </v-col>
        </v-row>
      </v-container>

      <v-btn
        v-show="fab"
        fab
        dark
        fixed
        bottom
        right
        color="brown"
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
      all_event: mockData,
      search: "",
      selectedStatus: null,
      statusOptions: {
        OnEvents: "Ongoing Events",
        UpEvents: "Upcoming Events",
        ExpEvents: "Expired Events",
      },
    };
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
    },
    toTop() {
      this.$router.push("festival/new");
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
<style scoped>
.centercard {
  margin: 15% 2vw;
  margin-bottom: 20%;
  height: 100%;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: 135px;
  border: 5px solid #e8b71a;
}

.maintext {
  margin-top: 10%;
  font-family: "Montserrat", sans-serif;
  text-align: center;
  color: rgb(143, 43, 49);
  font-size: 200%;
  line-height: 1.5;
  margin-left: 5%;
  margin-right: 5%;
}
.logoevent {
  height: 50%;
  width: 150px;
  border-radius: 10%;
}

.headcard {
  display: flex;
  justify-content: center;
  align-items: center;
  flex: 1;
  margin-left: 10%;
  margin-right: 10%;
  border-radius: 60px;
  background-color: rgb(232, 183, 26);
  height: 50%;
  width: max-content;
}

.HeadMarkText {
  color: black;
  font-weight: 650;
  font-family: "Montserrat", sans-serif;
  font-size: 250%;
  text-align: center;
  margin-top: 13px;
  margin-left: 10%;
  margin-right: 10%;
}
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
