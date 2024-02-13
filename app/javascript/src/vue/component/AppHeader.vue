<template>
  <div>
    <div
      class="d-flex justify-content-between align-items-center header pc p-3"
      v-if="isPCMode"
    >
      <div class="text-white cur-p" @click="redirectRoot">HOME</div>
      <ul class="d-flex gap-3 text-white align-items-center">
        <li class="cur-p">News</li>
        <li class="cur-p">Posts</li>
        <li class="cur-p">Contact</li>
        <li>
          <div class="avatar-wrap popper" @click="openTooltip">
            <img
              id="avatar_tooltip_toggle"
              src="../assets/images/default_a.png"
              alt="img"
            />
            <div id="tooltip" class="tooltip">
              <div class="cur-p tooltip-item">Profile</div>
              <div class="mt-2 cur-p tooltip-item" @click="logout">Logout</div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <div v-else>isMobileMode</div>
  </div>
</template>
<script>
import axios from "axios";
import redirectRoot from "../mixins/redirectRoot";
import { createPopper } from "@popperjs/core";

export default {
  name: "AppHeader",
  mixins: [redirectRoot],
  data() {
    return {
      popperInstance: null,
    };
  },
  computed: {
    isPCMode() {
      return true;
    },
  },
  methods: {
    openTooltip() {
      const avatar = document.getElementById("avatar_tooltip_toggle");
      const tooltip = document.getElementById("tooltip");
      if (!this.popperInstance) {
        this.popperInstance = createPopper(avatar, tooltip, {
          placement: "bottom",
        });
        tooltip.classList.add("show");
      } else {
        tooltip.classList.remove("show");
        this.popperInstance.destroy();
        this.popperInstance = null;
      }
    },
    logout() {
      try {
        axios.get("/logout");
        window.location.href = "/login";
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.avatar-wrap {
  height: 30px;
  width: 30px;
  cursor: pointer;

  img {
    width: 100%;
  }
}
</style>
