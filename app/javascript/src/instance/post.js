import { createApp } from 'vue';
import NewPost from '../vue/feature/posts/New.vue';
import EditPost from '../vue/feature/posts/Edit.vue';

document.addEventListener('DOMContentLoaded', () => {
  const $el1 = document.querySelector('.vue-new-post');
  createApp({
    components: { NewPost },
    template: '<NewPost/>'
  }).mount($el1);
  const $el2 = document.querySelector('.vue-edit-post');
  createApp({
    components: { EditPost },
    template: '<EditPost/>'
  }).mount($el2);
});
