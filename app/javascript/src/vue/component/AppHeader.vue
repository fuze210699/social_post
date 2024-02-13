<template>
  <div>
    <div class="d-flex justify-content-between header pc" v-if="isPCMode">
      isPCMode
    </div>
    <div v-else>
      isMobileMode
    </div>
  </div>
</template>
<script>
export default {
  name: "AppHeader",
  computed:{
    isPCMode(){
      return true
    }
  }
}
</script>
