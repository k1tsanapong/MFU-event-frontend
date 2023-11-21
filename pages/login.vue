<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="10" sm="10" md="8" lg="6">
        <v-card color="#89292F" rounded="xxl">
          <v-card-title class="white--text text-center">Login</v-card-title>
          <v-card-text>
            <v-row>
              <v-col cols="12">
                <div class="white--text">Username</div>
                <v-text-field
                  v-model="username"
                  id="username"
                  outlined
                  dense
                  background-color="white"
                  rounded
                  hide-details
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <div class="white--text">Password</div>
                <v-text-field
                  v-model="password"
                  id="password"
                  type="password"
                  outlined
                  dense
                  background-color="white"
                  rounded
                  hide-details
                ></v-text-field>
              </v-col>
            </v-row>
          </v-card-text>
          <v-row justify="center" class="mt-1">
            <v-col @click="userLogin" cols="5">
              <v-card
                color="#E8B71A"
                rounded="pill"
                class="pa-3"
              >
                <div
                  class="text-center font-weight-bold text-h6 grey--text text--darken-3"
                >
                  Login
                </div>
              </v-card>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  auth: 'guest',
  data() {
    return {
      err: null,
      username: "",
      password: "",
    }
  },
  methods: {
    async userLogin() {
      try {
        await this.$auth.loginWith('local', {
          data: { identifier: this.username, password: this.password },
        })
      } catch (e) {
        if (e.response) this.err = e.response.data.error.message
      }
    },
  },
}
</script>