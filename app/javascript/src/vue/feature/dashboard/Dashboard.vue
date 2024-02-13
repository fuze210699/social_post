<template>
  <div>
    <div class="p-2 d-flex flex-column gap-3">
      <div class="card" v-for="(post) in posts" :key="post.id">
        <div class="card-body">
          <h4>{{ post.title }}</h4>
          <div>
            {{ post.content }}
          </div>
        </div>
      </div>
      <button class="btn btn-primary" @click="redirectCreatePostScreen">
        Create Post
      </button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "DashboardScreen",
  created() {
    this.fetchPost();
  },
  data() {
    return {
      posts: []
    }
  },
  methods: {
    redirectCreatePostScreen() {
      const url = '/posts/new';
      window.location.href = url;
    },
    async fetchPost() {
      try {
        const res = await axios.get('/api/v1/posts');
        this.posts = res.data;
      } catch (error) {
        console.log(error);
      }
    }
  }
}
</script>
