import { createApp } from 'vue';
import AppLayout from '../vue/layout/Layout.vue';

document.addEventListener('DOMContentLoaded', () => {
  const $el1 = document.querySelector('.vue-dashboard');
  createApp({
    components: { AppLayout }
  }).mount($el1);
});
