<template>
  <v-app>
    <v-main>
      <nav-bar-component/>
      <br/>
      <br/>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import NavBarComponent from './components/utils/NavBar.vue';

export default {
  name: 'App',

  components: {
    NavBarComponent,
  },

  data: () => ({
    //
  }),
};
</script>
