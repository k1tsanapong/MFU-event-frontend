<template>
  <v-app dark>

    <v-app-bar app color="rgb(143, 43, 49)" height="170%">
      <nuxt-link to="/home">
        <img src="/mfueventlogo.png" alt="eventLogo" class="logoevent" />
      </nuxt-link>
      <v-card class="headcard" v-if="header">
        <v-card-text>
          <p class="HeadMarkText">            {{ header }}
</p>
        </v-card-text>
      </v-card>
      <v-menu offset-y bottom transition="slide-x-reverse-transition"  v-if="header">
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
          <v-list-item @click="handleProfile">
            <v-list-item-title >Profile</v-list-item-title>
          </v-list-item>
          <v-list-item  v-if="!$auth.loggedIn" @click="handleLogin">
            <v-list-item-title>Login</v-list-item-title>
          </v-list-item>
          <v-list-item v-else @click="handleLogout">
            <v-list-item-title>Logout</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-app-bar>


    <v-main>
      <nuxt />
    </v-main>


  </v-app>

  

</template>

<script>
export default {
  data() {
    return {
      headerKey: "",
      isLoggedIn: false,
    };
  },
  computed: {
    header() {
      return this.headerKey ? this.headerKey : "";
    },
  },

  provide() {
    return {
      setHeader: this.setHeader,
    };
  },

  methods: {
    setHeader(title) {
      if (!title) {
        this.headerKey = "";
      } else {
        this.headerKey = title;
      }
    },

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

    handleLogout() {
      this.$auth.logout();
      this.$router.push("/");
    },
    toTop() {
      this.$router.push("festival/new");
    },

  },
};
</script>

<style scoped>
@import url('typeface-montserrat');

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
  font-family: 'Montserrat', sans-serif;
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
