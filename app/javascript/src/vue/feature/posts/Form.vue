<template>
  <div>
    <div class="form-group mb-2">
      <label>Title</label>
      <input type="text" name="title" class="form-control" @change="change">
    </div>
    <div class="form-group">
      <label>Content</label>
      <textarea name="content" id="" cols="30" rows="10" class="form-control" @change="change"></textarea>
    </div>
  </div>
</template>
<script>
export default {
  name: "PostForm",
  methods: {
    change(e) {
      const { target: { name, value } } = e;
      this.$emit('change', { key: name, value })
    }
  },
}
</script>
