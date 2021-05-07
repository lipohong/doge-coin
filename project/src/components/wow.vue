<template>
  <section class="wow">
    <div class="progressBarContainer">
      <img class="dollarImage" :src="dollarImage">
      <div class="progressBarLeft" :style="`width: ${dogePrice * 100}%`">
        <div class="wowContainer" id="wowContainer">
          <img class="dogeImage" :src="dogecoinImage" />
          <main :style="`color: ${color}`">$ {{ dogePrice }}</main>
        </div>
      </div>
      <div class="progressBarRight" :style="`width: ${(1 - dogePrice ) * 100}%`"></div>
    </div>
  </section>
</template>
<script>
import dogecoinImage from '../assets/images/dogecoin.png';
import dollarImage from '../assets/images/dollar.jpg';

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
    generateWow(isIncrease) {
      const previousWowtext = document.getElementById('wowText');
      if (!!previousWowtext)
        previousWowtext.remove(); // remove previous text
      const wow = document.createElement("div");
      wow.id = 'wowText';
      let keyFrame = [];
      if (isIncrease) {
        keyFrame = [
          {
            top: '2rem',
            right: '2rem'
          },
          {
            top: 0,
            right: 0
          }
        ]
        wow.style.color = greenColor;
      } else {
        keyFrame = [
          {
            top: '2rem',
            left: '2rem'
          },
          {
            top: '4rem',
            left: 0
          }
        ]
        wow.style.color = redColor;
      }
      wow.animate(keyFrame, {});
      const wowText = document.createTextNode("wow");
      wow.appendChild(wowText);
      
      const wowContainer = document.getElementById('wowContainer');
      wowContainer.appendChild(wow);
    }
  },
  computed: {
    dogePrice() {
      return this.dogePrice.toFixed(4)
    }
  },
  watch: {
    dogePrice(newPrice, oldPrice) {
      newPrice = newPrice.toFixed(4);
      oldPrice = oldPrice.toFixed(4);
      if (newPrice > oldPrice) {
        this.color = greenColor;
        this.generateWow(true);
      } else if (newPrice == oldPrice) {
        this.color = 'black';
      } else {
        this.color = redColor;
        this.generateWow(false);
      }
    }
  }
}
</script>
