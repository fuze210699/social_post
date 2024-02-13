<template>
  <div>
    <div class="card" v-for="post in posts" :key="post.id">
      <div class="card-body">
        <h4>{{ post.title }}</h4>
        <div>
          {{ post.content }}
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "UserPosts",
  props:{
    posts:{
      type: Array,
      default: () => []
    }
  }
}
</script>
