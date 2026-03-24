<script setup lang="ts">
const props = defineProps<{
  id: number;
}>();
const client = useSupabaseClient();
const user = useSupabaseUser();

const { data: board } = await useAsyncData("board", async () => {
  const { data } = await client.from("Board").select("*").eq("id", props.id);
  return data?.[0];
});

const isOwner = computed(() => {
  return board.value?.authorId === user.value?.sub;
});

const handleDelete = async () => {
  const { error } = await client.from("Board").delete().eq("id", props.id);
  if (error) console.error(error);
  navigateTo("/board/card");
};
</script>

<template>
  <div>
    <h1>{{ board?.title }}</h1>
    <p>{{ board?.content }}</p>
    <UButton v-if="isOwner" @click="handleDelete">삭제</UButton>
  </div>
</template>
