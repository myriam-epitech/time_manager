import { createRouter, createWebHistory } from 'vue-router'
import User from '../components/User'
import WorkingTimes from '../components/WorkingTimes'
import WorkingTime from '../components/WorkingTime'
import HelloWorld from '../components/HelloWorld'

const routes = [
    {
        path: '/',
        component: HelloWorld
    },
    { 
        path: '/profile',
        component: User
    },
    { 
        path: '/workingTimes/:userID',
        component: WorkingTimes
    },
    { 
        path: '/workingTime/:userID',
        name: "createWorkingTime",
        component: WorkingTime
    },
    { 
        path: '/workingTime/:userID/:workingtimeID',
        name: "manageWorkingTime",
        component: WorkingTime
    },
]

const router = createRouter({
    history: createWebHistory(),
    base: process.env.BASE_URL,
    routes, // short for `routes: routes`
})

export default router
