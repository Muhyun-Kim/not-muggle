<script setup lang="ts">
const count = ref(0);
const increment = () => {
  count.value++;
};
const decrement = () => {
  count.value--;
};
</script>

<template>
  <div></div>
</template>
