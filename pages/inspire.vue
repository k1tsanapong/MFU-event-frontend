import { createVuetify} from 'vuetify'
<template>
  <v-app>
    <!-- Your custom app bar goes here -->
    <v-app-bar app color="#8F2B31"></v-app-bar>
    <v-container class="search-container">
      <!-- Search bar and button in the same column -->
      <v-col xs="12" sm="8">
        <v-row align="center">
          <v-col>
            <v-text-field
              v-model="search"
              label="Search"
              class="search-text-field"
              solo-inverted
              hide-details
              rounded
              outlined
            >
              <template v-slot:append>
                <v-icon>mdi-magnify</v-icon>
              </template>
            </v-text-field>
          </v-col>
          <v-col class="text-right" xs="12" sm="4">
            <v-btn @click="handleSort"
              >Sort
              <template>
                <v-icon>mdi-sort</v-icon>
              </template>
            </v-btn>
          </v-col>
        </v-row>
      </v-col>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      search: "",
    };
  },
};
</script>

<style>
.search-container {
  background-color: #bc8e5d;
  border-radius: 50px;
  width: 80%;
}
.search-text-field {
  background-color: white;
}
</style>
