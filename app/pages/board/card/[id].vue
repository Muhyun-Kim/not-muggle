<script setup lang="ts">
const route = useRoute();
const id = Number(route.params.id);
if (isNaN(id)) {
  throw createError({
    statusCode: 404,
    statusMessage: "Not Found",
    fatal: true,
  });
}
</script>

<template>
  <BoardId :id="id" />
</template>
