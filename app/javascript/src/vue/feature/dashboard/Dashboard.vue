<template>
  <div class="mt-4">
    <SectionBreakdown title="News" :leftBefore="-20" :rightAfter="-45" />
    <TechNews />
    <div class="d-flex justify-content-between align-items-center mt-4 pr-2">
      <SectionBreakdown title="Posts" :leftBefore="-20" :rightAfter="-45" />
      <button class="btn btn-primary" @click="redirectCreatePostScreen">
        Create Post
      </button>
    </div>
    <div class="p-2 d-flex flex-column gap-3">
      <UserPosts :posts="posts" />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import TechNews from "../tech_news/TechNews.vue";
import SectionBreakdown from "../../component/SectionBreakdown.vue";
import UserPosts from '../posts/index.vue';

export default {
  name: "DashboardScreen",
  components: { TechNews, SectionBreakdown, UserPosts },
  created() {
    this.fetchPost();
  },
  data() {
    return {
      posts: [],
    };
  },
  methods: {
    redirectCreatePostScreen() {
      const url = "/posts/new";
      window.location.href = url;
    },
    async fetchPost() {
      try {
        const res = await axios.get("/api/v1/posts");
        this.posts = res.data;
      } catch (error) {
        console.log(error);
      }
    },
  }
};
</script>
