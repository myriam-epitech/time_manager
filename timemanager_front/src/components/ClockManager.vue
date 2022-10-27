<template>
  <v-container shaped elevation="10"> 

    <v-btn v-if="!clockIn">CLOCK-IN</v-btn>
    <v-btn v-else>CLOCK-IN</v-btn>
  </v-container>
</template>

<script>

export default {
  data() {
    return {
      startDateTime: null,
      clockIn: false
    };
  },

  methods: {
     refresh(){
     },
     
     clock(){

     },
     
    }
};
</script>