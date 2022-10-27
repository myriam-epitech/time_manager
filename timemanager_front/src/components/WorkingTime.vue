<template>
  <v-container>
    <div v-if="workingtimeID_param && workingtimeInput">
      <h2> Manage my working time </h2>
      <!-- start: {{ workingtimeInput.start }}
      end: {{ workingtimeInput.end }} -->
    </div>
    <h2 v-else> Create a working time </h2>

    <v-form>
      <v-text-field v-model="workingtimeInput.start" type="datetime-local" label="Start" counter
        :disabled="workingtimeID_param && !edit">
      </v-text-field>
      <v-text-field v-model="workingtimeInput.end" type="datetime-local" label="End" counter
        :disabled="workingtimeID_param && !edit">
      </v-text-field>

    </v-form>
    <div v-if="workingtimeID_param">
      <v-btn v-if="!edit" class="mr-4" @click="edit = !edit">
        Edit <v-icon dark> mdi-pencil</v-icon>
      </v-btn>
      <div v-else>
        <v-btn class="mr-4" @click="updateWorkingTime()"> Submit </v-btn>
        <v-btn v-if="!modal" @click="modal = true">
          <v-icon dark> mdi-delete</v-icon>
        </v-btn>
      </div>
    </div>
    <div v-else>
      <v-btn class="mr-4" @click="createWorkingTime()"> Create </v-btn>
    </div>
    
    <div class="d-flex align-center flex-column">
      <v-card v-if="modal" width="600">
        <v-card-item>
          <v-card-title>Delete the working time</v-card-title>
        </v-card-item>

        <v-card-text>
          Are you sure you want to delete this working time ?
        </v-card-text>
        <v-btn class="mr-4" @click="modal = false"> Cancel </v-btn>
        <v-btn class="mr-4" @click="deleteWorkingTime()"> Delete </v-btn>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import moment from 'moment'
import { getWorkingTime, updateWT, createWorkingTime, deleteWorkingTime } from "../requests";

export default {
  data() {
    return {
      workingtimeID_param: this.$route.params.workingtimeID,
      userID_param: this.$route.params.userID,
      workingtime: null,
      workingtimeInput: {
        start: moment(new Date()).format('YYYY-MM-DDTHH:mm:ss'),
        end: moment(new Date()).format('YYYY-MM-DDTHH:mm:ss')
      },
      edit: false,
      modal: false
    };
  },
  beforeMount() {
    if (this.workingtimeID_param) {
      this.getWorkingTime()
    }
  },
  methods: {
    manageModal(action) {
      if (action == "show") this.modal = true
    },

    getWorkingTime() {
      getWorkingTime(this.userID_param, this.workingtimeID_param)
        .then(async (response) => {
          const res = await response.json();
          this.workingtime = res.data;
          this.workingtimeInput = res.data;
        })
        .catch(() => { });
    },

    createWorkingTime() {
      const body = {
        "wt": {
          "start": this.workingtimeInput.start,
          "end": this.workingtimeInput.end
        }
      }
      createWorkingTime(this.userID_param, body)
        .then(async (response) => {
          const res = await response.json();
          this.workingtimeInput = res.data;
          this.edit = false
          this.$router.push({ name: "allWorkingTimes", params: { userID: this.userID_param } })
        })
        .catch(() => { });
    },

    updateWorkingTime() {
      if (this.workingtimeInput.start == "" || this.workingtimeInput.end == "") return
      const body = {
        "wt": {
          "start": this.workingtimeInput.start,
          "end": this.workingtimeInput.end
        }
      }
      updateWT(this.workingtimeID_param, body)
        .then(async (response) => {
          const res = await response.json();
          this.workingtimeInput = res.data;
          this.edit = false
        })
        .catch(() => { });
    },

    deleteWorkingTime() {
      deleteWorkingTime(this.workingtimeID_param)
        .then(async (response) => {
          const res = await response.json();
          console.log("deleted ! " + res)
          this.$router.push({ name: "allWorkingTimes", params: { userID: this.userID_param } })
        })
        .catch(() => { });
      this.modal = false 
    },
  },
};
</script>