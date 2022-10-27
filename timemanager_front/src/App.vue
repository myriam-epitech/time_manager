<template>
  <v-app>
    <v-main>
      <v-app-bar app color="white" height="100">
        THIS IS THE APP BAR
      </v-app-bar>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
// import User from './components/User';

export default {
  name: 'App',

  // components: {
  //   User,
  // },

  data: () => ({
    //
  }),
};
</script>
