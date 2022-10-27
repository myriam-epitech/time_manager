<template>
  <v-card shaped elevation="10"> </v-card>
</template>

<script>
import { mapState } from "vuex";
import { getLoggedUser, updateUser } from "../../requests";

export default {
  data() {
    return {
      messageOK: false,
      isConnected: false,
      showPassword: false,
      rules: {
        required: (value) => !!value || "Required.",
        min: (v) => v.length >= 6 || "Min 6 characters",
      },
      edit: false,
      userName: "",
      userEmail: "",
      userPassword: "",
    };
  },

  watch: {
    storeUserConnected() {
      if (this.storeUserConnected[0] && this.edit == false) {
        this.userName = this.storeUserConnected[0].username;
        this.userEmail = this.storeUserConnected[0].email;
      }
    },
  },
  computed: {
    ...mapState({
      storeUserConnected: (s) => s.userConnected,
    }),
  },
  beforeMount(){
    this.$store.dispatch('redirection')
  },
  mounted() {
    if (this.storeUserConnected[0]) {
      this.userName = this.storeUserConnected[0].username;
      this.userEmail = this.storeUserConnected[0].email;
    }
  },
  methods: {
     createUser(){
      return "create"
     },
     
     updateUser(){
       return "update"

     },
     
     getUser(){
       return "get"

     },
     
     deleteUser(){
       return "delete"
       
     },
    }
};
</script>