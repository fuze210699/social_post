<template>
  <div>
    <div v-if="loading" class="skeleton">
      <div class="skeleton-item">
        <div class="loading-dots">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
      <div class="skeleton-item">
        <div class="loading-dots">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div>
    <div v-else class="swiper-container p-2">
      <div class="swiper-wrapper">
        <div
          v-for="(article, index) in articles"
          :key="index"
          class="swiper-slide"
        >
          <div class="card h-100">
            <div class="card-header">
              <div class="fz-24 text-truncate">
                {{ article.title }}
              </div>
            </div>
            <div class="card-body">
              <div class="mb-2">
                <img :src="article.urlToImage" alt="news" class="news-img" />
              </div>
              <div class="text-truncate">{{ article.description }}</div>
              <div class="mt-3 fz-12">
                <div>Author: {{ article.author }}</div>
                <div class="mt-1">Published At: {{ formatDate(article.publishedAt, 'YYYY-MM-DD') }}</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-pagination"></div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { Swiper } from "swiper";
import formatDate from "../../mixins/formatDate";

export default {
  name: "TechNewsSession",
  mixins: [formatDate],
  created() {
    this.fetchTechNews();
  },
  data() {
    return {
      articles: [],
      loading: false,
    };
  },
  methods: {
    async fetchTechNews() {
      try {
        this.loading = true;
        const {
          data: { articles },
        } = await axios.get(`/api/v1/news`);
        this.articles = articles;
        this.loading = false;
        this.$nextTick(()=>{
          this.initSwiper();
        });
      } catch (error) {
        console.log(error);
      }
    },
    initSwiper() {
      const swiper = new Swiper(".swiper-container", {
        slidesPerView: 2,
        spaceBetween: 20,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import "~swiper/swiper-bundle.min.css";
.news-img {
  width: 100%;
  max-width: 100%;
  height: 100%;
  max-height: 100px;
  object-fit: contain;
}

.swiper-slide {
  height: 240px;
}

.skeleton {
  display: flex;
  gap: 20px;
  padding: .5rem;
}

.skeleton-item {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 240px; /* Adjust height as needed */
  background-color: #f0f0f0; /* Light gray */
}

.loading-dots{
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 5px;
}

.loading-dots div {
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 50%;
  background-color: #000; /* Light gray */
  animation: bounce 0.8s infinite alternate;
  margin-right: 5px;
}

@keyframes bounce {
  to {
    transform: translateY(-10px);
  }
}
</style>
