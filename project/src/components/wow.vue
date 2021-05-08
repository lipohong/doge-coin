<template>
  <section class="wow">
    <div class="progressBarContainer">
      <img class="dollarImage" :src="dollarImage">
      <div class="progressBarLeft" :style="`width: ${dogePrice * 100}%`">
        <div class="wowContainer" id="wowContainer">
          <img class="dogeImage" :src="dogecoinImage" />
          <main :style="`color: ${color}`">$ {{ String(dogePrice).padEnd(7, '0') }}</main>
        </div>
      </div>
      <div class="progressBarRight" :style="`width: ${(1 - dogePrice ) * 100}%`"></div>
    </div>
  </section>
</template>
<script>
import dogecoinImage from '/dogecoin.png';
import dollarImage from '/dollar.jpg';

const greenColor = 'rgba(34, 168, 30, 0.7)';
const redColor = 'rgba(253, 4, 4, 0.7)';

export default {
  props: {
    dogePrice: {
      type: Number,
      required: true
    }
  },
  data() {
    return {
      color: 'black',
      dogecoinImage,
      dollarImage
    }
  },
  methods: {
    generateWow(value) {
      const previousWowtext = document.getElementById('wowText');
      if (!!previousWowtext)
        previousWowtext.remove(); // remove previous text
      const wow = document.createElement("div");
      wow.id = 'wowText';
      wow.classList.add('wowText');
      let keyFrame = [];
      if (value === 1) {
        wow.classList.add('increaseAnimation');
      } else if (value === -1) {
        wow.classList.add('decreaseAnimation');
      } else {
        wow.classList.add('equalAnimation');
      }
      wow.animate(keyFrame, {});
      const wowText = document.createTextNode("wow");
      wow.appendChild(wowText);
      
      const wowContainer = document.getElementById('wowContainer');
      wowContainer.appendChild(wow);
    }
  },
  watch: {
    dogePrice(newPrice, oldPrice) {
      if (newPrice > oldPrice) {
        this.color = greenColor;
        this.generateWow(1);
      } else if (newPrice == oldPrice) {
        this.color = 'black';
        this.generateWow(0);
      } else {
        this.color = redColor;
        this.generateWow(-1);
      }
    }
  }
}
</script>
