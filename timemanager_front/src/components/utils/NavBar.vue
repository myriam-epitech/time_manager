<template>
    <div>
        <v-app-bar app color="white" height="100"
            src="https://img.freepik.com/photos-gratuite/ciel-coucher-soleil-nuages-lumiere-rose-violet_102332-2534.jpg?size=626&ext=jpg">
            <v-avatar class="mr-3" color="grey lighten-5" size="70">
                <v-img contain max-height="70%" src="../../assets/logo.png"></v-img>
            </v-avatar>
            <v-app-bar-nav-icon @click.stop="openDrawer = !openDrawer"></v-app-bar-nav-icon>

            <v-toolbar-title>
                <v-btn text>
                    <router-link to="/">Home</router-link>
                </v-btn>
                <v-btn text>
                    <!-- <router-link to="/about">About</router-link> -->
                    ABOUT
                </v-btn>
            </v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-title>
                <v-btn v-if="connected" text>
                    <router-link to="/profile">Profile</router-link>
                </v-btn>
                <v-btn v-if="connected" text>
                    <!-- <router-link to="/login">LOGIN</router-link> -->
                    LOGIN
                </v-btn>
                <v-btn v-else text>
                    <!-- <a @click="clear()">LOGOUT</a> -->
                    LOGOUT
                </v-btn>
                <v-btn v-if="connected" text>
                    <!-- <router-link to="/register">REGISTER</router-link> -->
                    REGISTER
                </v-btn>
            </v-toolbar-title>
        </v-app-bar>

        <v-navigation-drawer v-model="openDrawer" fixed app>
            <v-row>
                <v-col cols="12">
                    <v-card @click="goTo('clock', { userID: userId })" dark>
                        <v-card-title>
                            <v-icon>mdi-clock</v-icon>
                            Clock-in/Clock-out
                        </v-card-title>
                        <v-card-subtitle>
                            When you arrive and leave work.
                        </v-card-subtitle>
                    </v-card>
                </v-col>
                <v-col cols="12">
                    <v-card @click="goTo('allWorkingTimes', { userID: userId })" dark>
                        <v-card-title>
                            <v-icon>mdi-clock</v-icon>
                            My time manager
                        </v-card-title>
                        <v-card-subtitle>
                            Check your hours of work.
                        </v-card-subtitle>
                    </v-card>
                </v-col>
            </v-row>
        </v-navigation-drawer>
    </div>
</template>
  
<script>
export default {
    name: "NavBarComponent",
    components: {},
    data() {
        return {
            openDrawer: false,
            connected: true,
            userId: null
        };
    },
    beforeMount() {
        this.userId = 1 //TODO get user connected
    },
    methods: {
        clear() {
            // this.$store.commit("deleteUserConnected");
        },
        goTo(_page, _params) {
            this.$router.push({ name: _page, params: _params })
        }
    },
};
</script>