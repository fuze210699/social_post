import { createApp } from 'vue';
import PostScreen from '../vue/feature/posts/index.vue';

document.addEventListener('DOMContentLoaded', () => {
  const $el1 = document.querySelector('.vue-posts');
  createApp({
    components: { PostScreen },
    template: '<posts/>'
  }).mount($el1);
});
