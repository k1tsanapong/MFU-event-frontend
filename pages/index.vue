<template>
  <div class="background-component">
    <v-row justify="center" align="center">
      <v-col cols="12" sm="8" md="6">
        <v-card class="centercard">
          <v-card-text>
            <p>
              Welcome to MFUEVENT
              You can look around what events
              and activities are going on around
              the school
              If you would like to request your events to be posted
              please contact (Phone number)
            </p>
          </v-card-text>
          <v-card-actions>
            <v-spacer />
            <v-btn color="primary" nuxt to="/inspire">
              Continue
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'IndexPage'
}
</script>

<style scoped>
.background-component {
  background-position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('/background-entry-page.png');
  background-size: cover;
  background-repeat: no-repeat;
  background-attachment: fixed;

  z-index: -1;
}

/* Style the v-card as needed */
.centercard {

  height: 70vh;
  width: 80vh;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
</style>



