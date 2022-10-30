<template>
  <v-card>
    <v-card-title class="text-center py-5">
      <v-row class="d-flex justify-center ">
        <h1 class="font-weight-bold text-h2 ml-auto mr-auto">
          My working times
        </h1>
        <div class="d-flex justify-end">
          <v-btn @Click="routerCreateWT()" class="ma-2" icon="mdi-plus"></v-btn>
        </div>
      </v-row>
    </v-card-title>

    <v-tabs v-model="tab" bg-color="transparent" grow>
      <v-tab v-for="item in items" :key="item" :value="item">
        {{ item }}
      </v-tab>
    </v-tabs>

    <v-window v-model="tab">
      <v-window-item value="List">
        <v-card flat>
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
            <tbody v-if="workingTimes.length == 0" class="text-center justify-center">
              No working times registered yet
            </tbody>
            <tbody v-else>
              <tr v-for="(wt) in workingTimes" :key="wt.id" @click="routerManageWT(wt.id)">
                <td>{{ wt.id }}</td>
                <td>{{ wt.start }}</td>
                <td>{{ wt.end }}</td>
              </tr>
            </tbody>
          </v-table>
        </v-card>
      </v-window-item>
      <v-window-item value="Calendar">
        <v-card color="basil" flat>
          <calendar :wt="workingTimes" v-if="workingTimes" />
        </v-card>
      </v-window-item>
    </v-window>
  </v-card>
</template>

<script>
import { getWorkingTimes } from "../requests";
import Calendar from './utils/Calendar.vue'

export default {
  components: { Calendar },
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

      tab: 'List',
      items: [
        'List', 'Calendar',
      ],
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