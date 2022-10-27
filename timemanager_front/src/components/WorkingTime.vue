<template>
  <v-container>
    <div v-if="workingtimeID_param && workingtimeInput">
      AFFICHER LE WORKING TIME
      START END
      MODIFIER/SUPPRIMER LE WORKING TIME:ripple="false"
      start: {{ workingtimeInput.start }}
      end: {{ workingtimeInput.end }}

      <v-form>
        <v-text-field v-model="workingtimeInput.start" type="datetime-local" label="Start" counter :disabled="!edit">
        </v-text-field>
        <v-text-field v-model="workingtimeInput.end" type="datetime-local" label="End" counter :disabled="!edit">
        </v-text-field>

      </v-form>
      <v-btn v-if="!edit" class="mr-4" @click="edit = !edit"> Edit <v-icon dark> mdi-pencil </v-icon>
      </v-btn>
      <v-btn v-else class="mr-4" @click="updateWorkingTime()"> Submit </v-btn>
    </div>
    <div v-else>
      CREER UN WORKING TIME
    </div>
  </v-container>
</template>

<script>
import { getWorkingTime, updateWT, createWorkingTime } from "../requests";

export default {
  props: ["userId"],
  data() {
    return {
      workingtimeID_param: this.$route.params.workingtimeID,
      userID_param: this.$route.params.userID,
      workingtime: null,
      workingtimeInput: null,
      edit: false
    };
  },
  watch: {
    // workingtimeInput() {
    //   if (!this.workingtimeInput) {
    //     this.$emit('loadWT')
    //   }
    // },
  },
  beforeMount() {
    this.getWorkingTime()
  },
  methods: {
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
        })
        .catch(() => { });
    },

    updateWorkingTime() {
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

    },
  },
};
</script>