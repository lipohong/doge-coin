<template>
  <section class="message">
    <header>{{ msg.title }}</header>
    <main>{{ msg.main }}</main>
  </section>
</template>
<script>
export default {
  data() {
    return {
      msg: {
        title: 'Doge Coin Sure To Be One Dollar💲',
        main: 'Be Diamond💎 Hand✋ Instead Of Papper📄 Hand👋'
      }
    }
  }
}
</script>