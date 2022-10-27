<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h2 v-if="idConnected">Profile</h2>
        <h2 v-else>Register</h2>
      </v-col>
    </v-row>
    <v-form>
      <div class="border border-secondary rounded p-3">
        <v-text-field
          v-model="username"
          label="Username"
          required
        ></v-text-field>

        <v-text-field
          v-model="email"
          :rules="emailRules"
          label="Email"
          required
        ></v-text-field>

        <v-text-field
          v-model="userPassword"
          :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
          :type="showPassword ? 'text' : 'password'"
          :rules="[passwordRules.required, passwordRules.min]"
          label="Password"
          hint="At least 6 characters"
          counter
          @click:append="showPassword = !showPassword"
        ></v-text-field>

        <v-text-field
          v-model="userPasswordConf"
          :append-icon="showPasswordConf ? 'mdi-eye' : 'mdi-eye-off'"
          :type="showPasswordConf ? 'text' : 'password'"
          :rules="[userPassword === userPasswordConf || 'Password must match']"
          label="Password Confirmation"
          hint="At least 6 characters"
          counter
          @click:append="showPasswordConf = !showPasswordConf"
        ></v-text-field>

        <v-btn v-if="idConnected" class="mr-4" @click="updateUser()"> Edit </v-btn>
        <v-btn v-else class="mr-4" @click="createUser()"> Register </v-btn>
      </div>
    </v-form>

    <v-btn v-if="!idConnected" class="mr-4" @click="getUser()"> SE CONNECTER </v-btn>
    <v-btn v-else class="mr-4" @click="idConnected = null"> DECONNECTER </v-btn>

  </v-container>
</template>

<script>
// import { mapState } from "vuex";
import { getUser, createUser, updateUser, deleteUser } from "../requests"; //, createUser, updateUser, deleteUser } from "../../requests";

export default {
  name: 'UserComponent',
  data() {
    return {
      showPassword: false,
      showPasswordConf: false,
      passwordRules: {
        required: (value) => !!value || "Required.",
        min: (v) => v.length >= 6 || "Min 6 characters",
      },
      emailRules: [
        (v) => !!v || "E-mail is required",
        (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
      ],
      email: "",
      username: "",
      userPassword: "",
      userPasswordConf: "",
      idConnected: 1 //TODO
    };
  },

  watch: {
    // storeUserConnected() {
    //   if (this.storeUserConnected[0] && this.edit == false) {
    //     this.userName = this.storeUserConnected[0].username;
    //     this.userEmail = this.storeUserConnected[0].email;
    //   }
    // },
  },
  computed: {
    // ...mapState({
    //   storeUserConnected: (s) => s.userConnected,
    // }),
  },
  beforeMount() {
    // this.$store.dispatch('redirection')
    this.getUser();
  },
  mounted() {
    // if (this.storeUserConnected[0]) {
    //   this.userName = this.storeUserConnected[0].username;
    //   this.userEmail = this.storeUserConnected[0].email;
    // }
  },
  methods: {
    createUser() {
      const body ={
        "user": {
          "username": this.username,
          "email": this.email
        }
      }

      createUser(body)
        .then(async (response) => {
          const res = await response.json();
          console.log(res)
          // if (res.status == "200") {
          //   setTimeout(function () {
          //     window.location.href = "http://localhost:8080/login?ok";
          //   }, 1200);
          // } else {
          //   this.messageERROR = true;
          //   setTimeout(function () {
          //     this.messageERROR = false;
          //   }, 3000);
          // }
        })
        .catch((error) => {
          console.log(error);
        });
    },

     updateUser(){
       const body ={
        "user": {
          "username": this.username,
          "email": this.email
        }
      }

      updateUser(this.idConnected, body)
        .then(async (response) => {
          const res = await response.json();
          console.log(res)
          // if (res.status == "200") {
          //   setTimeout(function () {
          //     window.location.href = "http://localhost:8080/login?ok";
          //   }, 1200);
          // } else {
          //   this.messageERROR = true;
          //   setTimeout(function () {
          //     this.messageERROR = false;
          //   }, 3000);
          // }
        })
        .catch((error) => {
          console.log(error);
        });

     },

    getUser() {
      getUser(1) // TODO change ID
        .then(async (response) => {
          const res = await response.json();
          this.username = res.data.username
          this.email = res.data.email
          this.idConnected = res.data.id
          // this.$store.commit("setUserConnected", res);
        })
        .catch(() => {});
    },

     deleteUser(){
        deleteUser(1) // TODO
        .then(async (response) => {
          const res = await response.json();
          console.log(res)
        })
        .catch(() => {});

     },
  },
};
</script>