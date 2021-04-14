<template>
  <div id="app">
    <input v-model="searchQuery">
    <button v-on:click="getImages">Search</button>
    <button v-show="searchQuery" v-on:click="removeSearchQuery">X</button>
    <ul v-if="images">
      <li v-for="i in images" :key="i.id">
        <img v-bind:src="'https://live.staticflickr.com/' + i.server + '/' + i.id + '_' + i.secret + '_q.jpg'">
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      images: [],
      searchQuery: ''
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
      this.searchQuery = '',
      this.images = []
    }
  }
}

</script>

<style scoped>
ul {
  background-color: black;
  display: flex;
  flex-flow: wrap;
  list-style-type: none;
}
li {
  margin: 0 0.2em;
}
</style>
