import { createVuetify} from 'vuetify'
<template>
  <v-app>
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
          <v-btn rounded @click="handleSort">Sort <v-icon>mdi-sort</v-icon></v-btn>
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
  </v-app>
</template>

<script>
export default {
  name: 'homepage',
  data() {
    return {
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
  },
};
</script>

<style>
.search-container {
  background-color: #bc8e5d;
  border-radius: 50px;
  width: 60%; /* Adjust the width as needed */
  max-width: 1200px;
  margin: 40px auto;
  padding: 40px ;
}

.search-text-field {
  font-size: 18px; /* Adjust the font size as needed */
  width: 80%;
}
.v-input--radio-group__input {
    justify-content: space-evenly;
}

/* Additional styling as needed */
</style>
