<template>
  <section class="wow">
    <div class="progressBarContainer">
      <img class="dollarImage" :src="dollarImage">
      <div class="progressBarLeft" :style="`width: ${dogePrice * 100}%`">
        <div class="wowContainer" id="wowContainer">
          <img id="dogeImage" class="dogeImage" :src="dogecoinImage" />
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
      const allWowText = document.getElementsByName('wowText');
      const len = allWowText.length;
      // remove previous text
      for (let i = 0; i < len; i++) {
        allWowText[i].parentNode.removeChild(allWowText[i]);
      }
      const dogeImage = document.getElementById("dogeImage");
      const wow = document.createElement("div");
      wow.setAttribute('name', 'wowText');
      wow.classList.add('wowText');
      if (value === 1) {  // price increse
        wow.classList.add('increaseAnimation');
        dogeImage.classList.add("mirror");
      } else if (value === -1) {  // price decrese
        wow.classList.add('decreaseAnimation');
        dogeImage.classList.remove("mirror");
      } else {  // price not change
        wow.classList.add('equalAnimation');
        dogeImage.classList.remove("mirror");
      }
      const wowText = document.createTextNode("wow");
      wow.appendChild(wowText);
      
      const wowContainer = document.getElementById('wowContainer');
      wowContainer.appendChild(wow);  // show the wow text
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
