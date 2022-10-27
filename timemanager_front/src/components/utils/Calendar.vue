<template>
  <v-container>
    <vue-cal :selected-date="today" :time-from="8 * 60" :time-to="23 * 60"
      :events="events"
      style="height: 800px"
      :on-event-click="(e) => onEventClick(e)"
      >
    </vue-cal>
  </v-container>
</template>

<script>
import VueCal from 'vue-cal'
import 'vue-cal/dist/vuecal.css'

export default {
  name: 'CalendarComponent',
  props: ["wt"],
  components: { VueCal },
  data() {
    return {
      today: new Date(),
      events: []
    }
  },
  watch: {
    wt: {
      deep: true,
      handler(value) {
        value.forEach(element => {
          var a = JSON.parse(JSON.stringify(element))
          a.start = new Date(a.start)
          a.end = new Date(a.end)
          a.class = 'work'

          this.events.push(a)
        });
      }
    }
  },
  methods: {
    onEventClick(event){
      this.$router.push({name: "manageWorkingTime", params:{userID:this.$route.params.userID, workingtimeID: event.id}})
    }
  }

}
</script>
<style scope>
.vuecal__event.work {
  background-color: rgba(148, 208, 248, 0.979);
  border: 1px solid rgb(90, 138, 228);
  color: #fff;
}
</style>
