<template>
  <section class="app">
    <Message />
    <Wow :dogePrice="dogePrice" />
  </section>
</template>
<script>
import axios from 'axios';
import Message from './components/message.vue';
import Wow from './components/wow.vue';

export default {
  data() {
    return {
      dogePrice: 0
    }
  },
  components: { Wow, Message },
  async mounted() {
    const url = 'https://api.binance.com';
    const symbol = 'DOGEUSDT';
    const res = await axios.get(`${url}/api/v3/ticker/price?symbol=${symbol}`);
    this.dogePrice = Number(res.data.price);
    if (!!window) {
      window.getPrice = setInterval(async () => {
        const res = await axios.get(`${url}/api/v3/ticker/price?symbol=${symbol}`);
        this.dogePrice = Number(res.data.price);
        document.title = `[$${this.dogePrice}] Doge To 1 Dollar!`;
      }, 1000);
    }
  },
  beforeUnmount() {
    if (!!window) {
      clearInterval(window.getPrice);
    }
  }
    
}
</script>
