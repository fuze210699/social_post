import { createApp } from 'vue';
import DashboardScreen from '../vue/feature/dashboard/Dashboard.vue';

document.addEventListener('DOMContentLoaded', () => {
  console.log(DashboardScreen);
  const $el1 = document.querySelector('.vue-dashboard');
  createApp({
    components: { DashboardScreen }
  }).mount($el1);
});
