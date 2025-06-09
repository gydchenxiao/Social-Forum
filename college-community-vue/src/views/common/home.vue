<template>
  <div class="mod-home">
    <h2>数据概览</h2>


    <base-info ref="baseInfo"/>

  </div>
</template>

<script>
import baseInfo from "./components/baseInfo";

export default {
  components: { baseInfo },
  data() {
    return {

    };
  },

};
</script>

<style>
.mod-home {
  line-height: 1.5;
}
</style>

