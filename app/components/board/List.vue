<script setup lang="ts">
const props = defineProps<{
  genre: "CARD" | "COIN";
  pageTitle: string;
}>();

const client = useSupabaseClient();
const { data: boards } = await useAsyncData("boards", async () => {
  const { data } = await client
    .from("Board")
    .select("*")
    .eq("genre", props.genre);
  return data;
});
</script>

<template>
  <div>
    <h1>{{ props.pageTitle }}</h1>
    <NuxtLink :to="`/board/${props.genre.toLowerCase()}/create`"
      >글쓰기</NuxtLink
    >
    <div v-for="board in boards" :key="board.id">
      <NuxtLink :to="`/board/${props.genre.toLowerCase()}/${board.id}`">{{
        board.title
      }}</NuxtLink>
    </div>
  </div>
</template>
