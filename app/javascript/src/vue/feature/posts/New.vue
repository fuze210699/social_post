<template>
  <div class="p-3">
    <h4 class="text-center text-uppercase mb-4">Create Post</h4>
    <PostForm @change="handleChange" />
    <div class="d-flex justify-content-end w-100 mt-4 gap-3">
      <button class="btn btn-secondary" @click="redirectRoot">Cancel</button>
      <button class="btn btn-primary" @click="submit">Create</button>
    </div>
  </div>
</template>
<script>
import PostForm from "./Form.vue"
import axios from 'axios';
import redirectRoot from "../../mixins/redirectRoot";

export default {
  name: "NewPost",
  components: { PostForm },
  mixins: [redirectRoot],
  data() {
    return {
      post: {
        title: '',
        content: ''
      }
    }
  },
  methods: {
    handleChange({ key, value }) {
      this.post[key] = value;
    },
    async submit() {
      try {
        const data = {
          ...this.post
        }
        await axios.post('/api/v1/posts', data);
        this.redirectRoot();
      } catch (error) {
        console.log(error);
      }
    }
  },
}
</script>
