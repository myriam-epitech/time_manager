<template>
  <v-container shaped elevation="10">
    <h2>Clock-in</h2>
    <v-hover v-slot="{ isHovering, props }">
      <v-card class="d-flex justify-center pa-md-4 mx-lg-auto" max-width="400" :elevation="isHovering ? 12 : 2"
        :class="{ 'on-hover': isHovering }" height="300" v-bind="props" @click="refresh()" >
        <v-col cols="12" lg="6" md="6" class="fill-height d-flex flex-column justify-center align-center">
          <strong v-if="clockIn">
            CLOCK-OUT
          </strong>
          <strong v-else>
            CLOCK-IN
          </strong>
        </v-col>
      </v-card>
      <strong v-if="clockIn">
        Last clocking-in : {{new Date(startDateTime)}}
      </strong>
    </v-hover>
  </v-container>
</template>

<script>

import { createOrRefreshClock, getClock, createWorkingTime } from '../requests'

export default {
  data() {
    return {
      userID_param: this.$route.params.userID,
      startDateTime: null,
      clockIn: false
    };
  },
  beforeMount() {
    this.clock()
  },
  methods: {
    refresh() {
      this.clockIn = !this.clockIn
      if (this.clockIn) {
        this.startDateTime = new Date()
      }
      const body = {
        "clock": {
          "status": this.clockIn,
          "time": this.startDateTime
        }
      }
      createOrRefreshClock(this.userID_param, body)
        .then(async (response) => {
          const res = await response.json();
          console.log(res)
          if (res.data.status == false) {
            this.createWorkingTime()
          }
        })
        .catch(() => { });
    },

    clock() {
      getClock(this.userID_param)
        .then(async (response) => {
          const res = await response.json();
          if (response.status == 200 && res.data.length > 0) {
            this.startDateTime = res.data[0].time
            this.clockIn = res.data[0].status
          }
        })
        .catch(() => { });
    },

    createWorkingTime() {
      console.log("entree dans create wt")
      console.log(this.userID_param)
      const body = {
        "wt": {
          "start": this.startDateTime,
          "end": new Date()
        }
      }
      createWorkingTime(this.userID_param, body)
        .then(async (response) => {
          const res = await response.json();
          console.log(res)
        })
        .catch(() => { });
    }
  }
};
</script>