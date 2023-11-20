<template>
    <div class="background-component">
      <v-row justify="center" align="center">
        <v-col cols="12" sm="10" md="8" lg="6">
          <v-spacer></v-spacer>
          <v-card class="login-card">
            <v-card-title class="text-h6">Login</v-card-title>
            <v-card-text class="textincard">
              <div class="input-container">
                <label for="username">Username</label>
                <div class="input-box">
                  <input id="username" type="text" v-model="username" />
                </div>
              </div>
              <div class="input-container">
                <label for="password">Password</label>
                <div class="input-box">
                  <input id="password" type="password" v-model="password" />
                </div>
              </div>
            </v-card-text>
            <v-card-actions>
              <v-btn color="#E8B71A" block @click="login">Login</v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AdLogin',
  
    methods: {
      async login() {
        try {
          // Replace the following API endpoint with your actual backend login endpoint
          const response = await this.$axios.post('/api/login', {
            username: this.username,
            password: this.password,
          });
  
          // Assuming your backend returns a success status
          if (response.data.success) {
            this.isLoggedIn = true;
           
          } else {
            
          }
        } catch (error) {
          console.error('Error during login:', error);
          // Handle other errors (network issues, server errors, etc.)
        }
      },
    },
  
    data() {
      return {
        username: '',
        password: '',
        isLoggedIn: true,
      };
    },
  };
  </script>
  
  <style scoped>
  .background-component {
    background-color: white;
    border-radius: 135px;
    margin-top: 10%;
  }
  
  .login-card {
    background-color: #89292F;
  }
  
  .text-h6 {
    color: white;
  }
  
  .input-container {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
    color: white;
  }
  
  .input-box {
    background-color: #fff;
    border-radius: 5px;
    padding: 5px;
  }
  
  .input-box input {
    border: none;
    background: transparent;
    color: #000;
    outline: none;
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
    font-family: 'Montserrat', sans-serif;
    font-size: 250%;
    text-align: center;
    margin-top: 13px;
    margin-left: 10%;
    margin-right: 10%;
  }
  </style>
 