<template>
  <div>
    <v-row>
      <v-col cols="12" class="d-flex justify-end mb-6">
        <v-btn @Click="routerCreateWT()" class="ma-2" icon="mdi-plus"></v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <v-table>
          <thead>
            <tr>
              <th class="text-left">Id</th>
              <th class="text-left">
                Start
              </th>
              <th class="text-left">
                End
              </th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(wt) in workingTimes" :key="wt.id" @click="routerManageWT(wt.id)">
              <!-- <working-time :userId="userId" :workingtime="wt" @loadWT="getWorkingTimes()" /> -->
              <td>{{ wt.id}}</td>
              <td>{{ wt.start }}</td>
              <td>{{ wt.end }}</td>
            </tr>
          </tbody>
        </v-table>
      </v-col>
    </v-row>
    <v-row>
      <calendar :wt="workingTimes" v-if="workingTimes"/>
    </v-row>
  </div>
  <!-- 
  <div :key="index" v-for="(wt, index) in workingTimes">
    <router-link :to="{ name: 'manageWorkingTime', params: { userID: userId, workingtimeID: wt.id } }">
      <working-time :userId="userId" :workingtime="wt" :start="wt.start" />
    </router-link>
  </div> -->
</template>

<script>
import { getWorkingTimes } from "../requests";
import Calendar from './utils/Calendar.vue'
// import WorkingTime from "./WorkingTime.vue";

export default {
  components: { Calendar },
  // components: { WorkingTime },
  data() {
    return {
      headers: [
        {
          text: '',
          align: 'start',
          value: 'index',
        },
        { text: 'Start', value: 'start' },
        { text: 'End', value: 'end' },
      ],
      userId: this.$route.params.userID,
      workingTimes: [],
    };
  },
  beforeMount() {
    this.getWorkingTimes();
  },
  methods: {
    getWorkingTimes() {
      getWorkingTimes(this.userId)
        .then(async (response) => {
          const res = await response.json();
          this.workingTimes = res.data;
        })
        .catch(() => { });
    },

    routerCreateWT() {
      this.$router.push({ name: 'createWorkingTime', params: { userID: this.userId } });
    },

    routerManageWT(id) {
      this.$router.push({ name: 'manageWorkingTime', params: { userID: this.userId, workingtimeID: id } });
    }
  },
};
</script>