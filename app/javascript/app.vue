<template>
  <div id="app">
    <section class="search">
      <input v-model="searchQuery">
      <button @click="getImages">Search</button>
      <button v-show="searchQuery" @click="removeSearchQuery">X</button>
    </section>
    <ul v-if="images">
      <li v-for="i in images" :key="i.id">
        <img :src="'https://live.staticflickr.com/' + i.server + '/' + i.id + '_' + i.secret + '_q.jpg'" @click="passToModal(i)">
      </li>
    </ul>
    <ImageModal v-bind:image="selectedImage" v-if="showModal" @close="showModal = false" />
  </div>
</template>

<script>
import axios from 'axios';
import ImageModal from "./packs/components/ImageModal.vue"

export default {
  data: function () {
    return {
      images: [],
      searchQuery: '',
      selectedImage: '',
      showModal: false
    }
  },
  methods: {
    getImages: function () {
      axios
        .get('/search', { params: { text: this.searchQuery } })
        .then(response => this.images = response.data)
        .catch(error => console.log(error))
    },
    removeSearchQuery: function () {
      this.searchQuery = ''
      this.images = []
    },
    passToModal: function (i) {
      this.selectedImage = i
      this.showModal = true
    }
  },
  components: {
    ImageModal
  }
}

</script>

<style scoped>
#app {
  display: flex;
  flex-flow: column;
}

ul {
  display: flex;
  flex-flow: wrap;
  list-style-type: none;
}

li {
  margin: 0 0.2em;
}
</style>
