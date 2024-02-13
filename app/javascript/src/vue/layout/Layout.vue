<template>
  <div>
    <AppHeader />
    <Dashboard />
    <AppFooter />
  </div>
</template>
<script>
import AppHeader from '../component/AppHeader.vue';
import AppFooter from '../component/AppFooter.vue'
import Dashboard from '../feature/dashboard/Dashboard.vue';

export default {
  name: "AppLayout",
  components: { AppHeader, AppFooter, Dashboard }
}
</script>
