<template>
  <div class="section-breakdown">
    <span class="fz-24 text-bold fw-5 position-relative title">
      <span class="before"></span>
      {{ title }}
      <span class="after"></span>
    </span>
  </div>
</template>
<script>
export default {
  name: "SectionBreakdown",
  props: {
    title: {
      type: String,
      default: "",
    }
  },
};
</script>
<style lang="scss" scoped>
.section-breakdown {
  padding-left: calc(0.5rem + 20px);

  .title {
    .before {
      position: absolute;
      content: "";
      height: 3px;
      width: 15px;
      background-color: blue;
      bottom: 4px;
      left: -20px;
    }

    .after {
      position: absolute;
      content: "";
      height: 3px;
      width: 40px;
      background-color: blue;
      right: -45px;
      bottom: 4px;
    }
  }
}
</style>
